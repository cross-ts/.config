-- Git integration for buffers
---@type configs.PluginSpec
return {
  'gitsigns.nvim',
  src = 'https://github.com/lewis6991/gitsigns.nvim',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
}
