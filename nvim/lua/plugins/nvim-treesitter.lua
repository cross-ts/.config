-- Nvim Treesitter configurations and abstraction layer
---@type LazyPluginSpec
return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context',
    'RRethy/nvim-treesitter-endwise',
  },
  lazy = false,
  opts = {}
}
