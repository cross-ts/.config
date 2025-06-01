-- Git integration for buffers
return {
  'lewis6991/gitsigns.nvim',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
}
