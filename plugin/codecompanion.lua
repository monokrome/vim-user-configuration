-- CodeCompanion configuration
-- Supports Claude (cloud) and Ollama (local models)

local ok, codecompanion = pcall(require, 'codecompanion')
if not ok then
  return
end

-- Auto-detect hardware and select appropriate model
local function detect_local_model()
  local vram_gb = 0
  local ram_gb = 0

  -- Detect NVIDIA VRAM
  local nvidia_handle = io.popen('nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits 2>/dev/null')
  if nvidia_handle then
    local nvidia_output = nvidia_handle:read('*a')
    nvidia_handle:close()
    local vram_mb = tonumber(nvidia_output:match('%d+'))
    if vram_mb then
      vram_gb = math.floor(vram_mb / 1024)
    end
  end

  -- Detect AMD VRAM (ROCm)
  if vram_gb == 0 then
    local rocm_handle = io.popen('rocm-smi --showmeminfo vram --csv 2>/dev/null | tail -1')
    if rocm_handle then
      local rocm_output = rocm_handle:read('*a')
      rocm_handle:close()
      local vram_bytes = tonumber(rocm_output:match('%d+'))
      if vram_bytes then
        vram_gb = math.floor(vram_bytes / 1024 / 1024 / 1024)
      end
    end
  end

  -- Detect system RAM as fallback
  local mem_handle = io.popen('free -g 2>/dev/null | grep Mem')
  if mem_handle then
    local mem_output = mem_handle:read('*a')
    mem_handle:close()
    ram_gb = tonumber(mem_output:match('Mem:%s+(%d+)')) or 0
  end

  -- Select model based on available memory
  -- Prioritize VRAM, fall back to RAM for CPU inference
  local available = vram_gb > 0 and vram_gb or math.floor(ram_gb * 0.7)

  -- Prefer qwen3-coder (MoE, more efficient) where possible
  if available >= 24 then
    return 'qwen3-coder:30b'  -- 19GB, 30B total / 3.3B active (MoE)
  elseif available >= 16 then
    return 'qwen2.5-coder:14b'  -- qwen3-coder:30b is 19GB, too tight
  elseif available >= 12 then
    return 'qwen2.5-coder:14b'
  elseif available >= 8 then
    return 'qwen2.5-coder:7b'
  elseif available >= 4 then
    return 'qwen2.5-coder:3b'
  else
    return 'qwen2.5-coder:1.5b'
  end
end

local detected_model = detect_local_model()

codecompanion.setup({
  strategies = {
    chat = {
      adapter = 'anthropic',  -- Default to Claude
    },
    inline = {
      adapter = 'anthropic',
    },
    agent = {
      adapter = 'anthropic',
    },
  },

  adapters = {
    http = {
      -- Claude (requires ANTHROPIC_API_KEY environment variable)
      anthropic = function()
        return require('codecompanion.adapters').extend('anthropic', {
          schema = {
            model = {
              default = 'claude-sonnet-4-20250514',
            },
          },
        })
      end,

      -- Ollama with auto-detected model based on hardware
      ollama = function()
        return require('codecompanion.adapters').extend('ollama', {
          schema = {
            model = {
              default = detected_model,
            },
          },
          env = {
            url = 'http://localhost:11434',
          },
        })
      end,
    },
  },

  display = {
    chat = {
      window = {
        layout = 'vertical',  -- vertical, horizontal, or float
        width = 0.4,
        relative = 'editor',
      },
    },
  },

  opts = {
    log_level = 'ERROR',
  },
})

-- Keymaps
vim.keymap.set('n', '<leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'Toggle CodeCompanion chat' })
vim.keymap.set('v', '<leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'Toggle CodeCompanion chat' })
vim.keymap.set('n', '<leader>ca', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion actions' })
vim.keymap.set('v', '<leader>ca', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion actions' })
vim.keymap.set('v', '<leader>cs', '<cmd>CodeCompanionChat Add<cr>', { desc = 'Send selection to chat' })

-- Quick adapter switching
vim.keymap.set('n', '<leader>cC', function()
  vim.cmd('CodeCompanionChat Toggle anthropic')
end, { desc = 'Chat with Claude' })

vim.keymap.set('n', '<leader>cL', function()
  vim.cmd('CodeCompanionChat Toggle ollama')
end, { desc = 'Chat with local model' })

-- Inline assistance
vim.keymap.set('n', '<leader>ci', '<cmd>CodeCompanion<cr>', { desc = 'Inline CodeCompanion' })
vim.keymap.set('v', '<leader>ci', '<cmd>CodeCompanion<cr>', { desc = 'Inline CodeCompanion' })

-- Command to easily switch default adapter
vim.api.nvim_create_user_command('CCLocal', function()
  require('codecompanion').setup({
    strategies = { chat = { adapter = 'ollama' }, inline = { adapter = 'ollama' } }
  })
  print('CodeCompanion: Switched to ' .. detected_model .. ' (local)')
end, { desc = 'Switch CodeCompanion to local model' })

vim.api.nvim_create_user_command('CCClaude', function()
  require('codecompanion').setup({
    strategies = { chat = { adapter = 'anthropic' }, inline = { adapter = 'anthropic' } }
  })
  print('CodeCompanion: Switched to Claude')
end, { desc = 'Switch CodeCompanion to Claude' })

vim.api.nvim_create_user_command('CCInfo', function()
  print('CodeCompanion: Auto-detected model: ' .. detected_model)
end, { desc = 'Show detected local model' })
