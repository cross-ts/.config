--- @type vim.lsp.Config
return {
  filetypes = { 'php', 'php.stub' },
  settings = {
    intelephense = {
      environment = {
        includePaths = {
          'vendor/rector/rector/vendor/rector/rector-phpunit',
        },
      },
    },
  },
}
