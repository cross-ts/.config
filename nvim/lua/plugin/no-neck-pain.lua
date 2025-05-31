-- ☕ Dead simple yet super extensible plugin to center the currently focused buffer to the middle of the screen.
return {
  'shortcuts/no-neck-pain.nvim',
  cmd = {
    'NoNeckPain',
  },
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  opts = {
    autocmds = {
      enableOnVimEnter = true,
      enableOnTabEnter = true,
    }
  },
}
