-- mason-null-ls bridges mason.nvim with the null-ls plugin - making it easier to use both plugins together.
---@type configs.PluginSpec
return {
  'mason-null-ls.nvim',
  src = 'https://github.com/jay-babu/mason-null-ls.nvim',
  enabled = false,
  cmd = {
    'NoneLsInstall',
    'NoneLsUninstall',
  },
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  before = function()
    require('lz.n').trigger_load({ 'none-ls.nvim', 'mason.nvim' })
  end,
  after = function()
    require('mason').setup()
    require('mason-null-ls').setup({
      handlers = {},
    })
    require('null-ls').setup()
  end,
}
