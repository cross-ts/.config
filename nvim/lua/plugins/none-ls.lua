-- null-ls.nvim reloaded / Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
---@type LazyPluginSpec
return {
  'nvimtools/none-ls.nvim',
  main = 'null-ls',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  config = function()
    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
        require('configs.none-ls.actionlint'),
        require('configs.none-ls.phpstan'),
      },
    })
  end,
}
