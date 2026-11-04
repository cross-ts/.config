-- Show code context
---@type configs.PluginSpec
return {
  'nvim-treesitter-context',
  src = 'https://github.com/nvim-treesitter/nvim-treesitter-context',
  lazy = false,
  after = function()
    require('treesitter-context').setup({})
  end,
}
