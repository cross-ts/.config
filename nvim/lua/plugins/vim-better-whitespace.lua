-- Better whitespace highlighting for Vim
---@type configs.PluginSpec
return {
  'vim-better-whitespace',
  src = 'https://github.com/ntpeters/vim-better-whitespace',
  event = 'BufRead',
  beforeAll = function()
    vim.g.strip_whitespace_on_save = 1
  end,
}
