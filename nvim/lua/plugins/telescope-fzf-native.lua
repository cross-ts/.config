-- FZF sorter for telescope written in c
---@type configs.PluginSpec
return {
  'telescope-fzf-native.nvim',
  src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  build = 'make',
  -- telescope.nvim の after で trigger_load する
  lazy = true,
}
