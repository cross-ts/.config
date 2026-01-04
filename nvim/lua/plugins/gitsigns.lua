-- Git integration for buffers
---@type LazyPluginSpec
return {
  'lewis6991/gitsigns.nvim',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
}
