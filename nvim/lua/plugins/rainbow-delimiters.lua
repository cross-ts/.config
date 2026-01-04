-- Rainbow delimiters for Neovim with Tree-sitter
---@type LazyPluginSpec
return {
  'HiPhish/rainbow-delimiters.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  event = {
    'BufNewFile',
    'BufReadPre',
  },
}
