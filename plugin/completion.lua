vim.opt.signcolumn = 'yes'

vim.o.updatetime = 250

-- Show diagnostics in a floating window on CursorHold
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = true,
      prefix = ' ',
      scope = 'cursor',
    })
  end
})

-- Toggle lsp_lines (wrapped in pcall in case plugin not installed)
pcall(function()
  vim.keymap.set(
    "",
    "<Leader>l",
    require("lsp_lines").toggle,
    { desc = "Toggle lsp_lines" }
  )
end)

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
})

-- Set up LSP capabilities with cmp-nvim-lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_lsp_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_lsp_ok then
  capabilities = vim.tbl_deep_extend('force', capabilities, cmp_lsp.default_capabilities())
end

-- Set up keymaps after an LSP server has been attached
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
  end,
})

-- Python venv detection (matches ~/.local/etc/zsh/plugins/python.zsh)
local function detect_python_venv(root_dir)
  local home = vim.env.HOME
  local env_root = vim.env.ENV_ROOT or (home .. '/.local/share/virtualenvs')

  local function file_exists(path)
    return vim.fn.filereadable(path) == 1
  end

  local function is_uv_project(dir)
    if file_exists(dir .. '/uv.lock') then return true end
    if file_exists(dir .. '/.python-version') then return true end
    if file_exists(dir .. '/pyproject.toml') then
      local ok, content = pcall(vim.fn.readfile, dir .. '/pyproject.toml')
      if ok then
        for _, line in ipairs(content) do
          if line:match('%[tool%.uv%]') then return true end
        end
      end
    end
    return false
  end

  local function hash_basename(dir)
    local basename = vim.fn.fnamemodify(dir, ':t')
    local handle = io.popen('echo "' .. basename .. '" | shasum 2>/dev/null || echo "' .. basename .. '" | sha256sum 2>/dev/null || echo "' .. basename .. '" | md5sum 2>/dev/null')
    if handle then
      local result = handle:read('*a')
      handle:close()
      return result:match('^(%S+)')
    end
    return nil
  end

  -- 1. Check for custom venv at ENV_ROOT/<hash>/<project_name>/
  local project_name = vim.fn.fnamemodify(root_dir, ':t')
  local hashed = hash_basename(root_dir)
  if hashed then
    local custom_venv = env_root .. '/' .. hashed .. '/' .. project_name
    local python_path = custom_venv .. '/bin/python'
    if file_exists(python_path) then
      return python_path
    end
  end

  -- 2. Check for .venv in project root
  local dot_venv = root_dir .. '/.venv/bin/python'
  if file_exists(dot_venv) then
    return dot_venv
  end

  -- 3. Check for venv/ in project root
  local venv = root_dir .. '/venv/bin/python'
  if file_exists(venv) then
    return venv
  end

  -- 4. If uv project with no local venv, use uv run
  if is_uv_project(root_dir) and vim.fn.executable('uv') == 1 then
    return 'uv'
  end

  -- 5. Fall back to system python
  return vim.fn.exepath('python3') or vim.fn.exepath('python')
end

-- Neovim 0.11+ LSP configuration using vim.lsp.config
-- Configure LSP servers
vim.lsp.config('pylsp', {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Detect venv and configure jedi environment
    local root_dir = client.root_dir or vim.fn.getcwd()
    local python = detect_python_venv(root_dir)
    if python == 'uv' then
      -- Restart with uv run if needed
      vim.notify("Python (uv): using 'uv run pylsp'", vim.log.levels.DEBUG)
    elseif python then
      client.settings = vim.tbl_deep_extend('force', client.settings or {}, {
        pylsp = {
          plugins = {
            jedi = { environment = python }
          }
        }
      })
      vim.notify("Python: using " .. python, vim.log.levels.DEBUG)
    end
  end,
})

vim.lsp.config('rust_analyzer', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', '.git' },
  capabilities = capabilities,
})

vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
  capabilities = capabilities,
})

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  capabilities = capabilities,
})

vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },
  capabilities = capabilities,
})

vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.stylua.toml', 'stylua.toml', '.git' },
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
})

-- Enable all configured LSP servers
vim.lsp.enable({ 'pylsp', 'rust_analyzer', 'ts_ls', 'gopls', 'clangd', 'lua_ls' })

local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
  return
end

cmp.setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
  }, {
    { name = 'buffer', keyword_length = 3 },
  }),
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- Navigate completion menu
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),

    -- Scroll docs
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    -- Trigger completion
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Cancel
    ['<C-e>'] = cmp.mapping.abort(),

    -- Confirm selection
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      elseif vim.snippet.active({ direction = 1 }) then
        vim.snippet.jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.snippet.active({ direction = -1 }) then
        vim.snippet.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        buffer = '[Buf]',
        path = '[Path]',
      })[entry.source.name]
      return vim_item
    end,
  },
})
