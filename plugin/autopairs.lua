-- nvim-autopairs configuration
local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then
  return
end

autopairs.setup({
  check_ts = true,  -- Use treesitter to check for pairs
  ts_config = {
    lua = { 'string' },
    javascript = { 'template_string' },
  },
  fast_wrap = {
    map = '<M-e>',  -- Alt+e to wrap
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey = 'Comment',
  },
})

-- Integrate with nvim-cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_ok, cmp = pcall(require, 'cmp')
if cmp_ok then
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end
