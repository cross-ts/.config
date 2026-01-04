-- mason-null-ls bridges mason.nvim with the null-ls plugin - making it easier to use both plugins together.
---@type LazyPluginSpec
return {
  'jay-babu/mason-null-ls.nvim',
  enabled = false,
  dependencies = {
    'nvimtools/none-ls.nvim',
    'mason-org/mason.nvim',
  },
  cmd = {
    'NoneLsInstall',
    'NoneLsUninstall',
  },
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  config = function()
    require('mason').setup()
    require('mason-null-ls').setup({
      handlers = {},
    })
    require('null-ls').setup()
  end,
}
