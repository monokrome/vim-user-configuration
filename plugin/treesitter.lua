-- Treesitter configuration
local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

-- Enable nvim-ts-autotag
local autotag_ok, autotag = pcall(require, 'nvim-ts-autotag')
if autotag_ok then
  autotag.setup()
end

treesitter.setup({
  -- Install parsers for languages you use
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'css',
    'go',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'python',
    'rust',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    -- Disable for large files
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },

  indent = {
    enable = true,
  },

  -- Incremental selection based on syntax tree
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      scope_incremental = '<S-CR>',
      node_decremental = '<BS>',
    },
  },
})
