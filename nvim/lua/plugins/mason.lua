-- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
---@type configs.PluginSpec
return {
  'mason.nvim',
  src = 'https://github.com/mason-org/mason.nvim',
  enabled = false,
  cmd = {
    'Mason',
    'MasonUpdate',
    'MasonInstall',
    'MasonUninstall',
    'MasonUninstallAll',
    'MasonLog',
  },
  after = function()
    require('mason').setup({})
  end,
}
