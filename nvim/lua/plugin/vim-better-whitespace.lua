-- Better whitespace highlighting for Vim
return {
  'ntpeters/vim-better-whitespace',
  event = 'BufRead',
  init = function()
    vim.g.strip_whitespace_on_save = 1
  end,
}
