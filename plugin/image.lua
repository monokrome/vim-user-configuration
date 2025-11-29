-- image.nvim configuration
-- Inline image preview using kitty/sixel/ueberzug

local ok, image = pcall(require, 'image')
if not ok then
  return
end

-- Detect best backend for current terminal
local function detect_backend()
  local term = vim.env.TERM or ''
  local term_program = vim.env.TERM_PROGRAM or ''
  local kitty = vim.env.KITTY_WINDOW_ID

  if kitty then
    return 'kitty'
  elseif term_program == 'WezTerm' or term:match('wezterm') then
    return 'sixel'
  elseif term:match('xterm') or term:match('foot') then
    return 'sixel'
  else
    return 'ueberzug'
  end
end

-- Check if running in tmux
local function in_tmux()
  return vim.env.TMUX ~= nil
end

image.setup({
  backend = detect_backend(),

  -- Required for kitty inside tmux
  kitty_method = in_tmux() and 'unicode-placeholders' or 'normal',

  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { 'markdown', 'vimwiki' },
    },
    neorg = {
      enabled = true,
      filetypes = { 'norg' },
    },
    html = {
      enabled = false,
    },
    css = {
      enabled = false,
    },
  },

  max_width = nil,  -- auto
  max_height = nil,  -- auto
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,

  window_overlap_clear_enabled = false,
  window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },

  editor_only_render_when_focused = false,
  tmux_show_only_in_active_window = false,

  hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp', '*.avif' },
})

-- Keymaps for image operations
vim.keymap.set('n', '<leader>ic', function()
  image.clear()
end, { desc = 'Clear images' })

vim.keymap.set('n', '<leader>ir', function()
  -- Refresh images by clearing and re-rendering
  image.clear()
  vim.cmd('edit')
end, { desc = 'Refresh images' })
