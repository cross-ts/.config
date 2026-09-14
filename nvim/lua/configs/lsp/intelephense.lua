--- @type vim.lsp.Config
return {
  filetypes = { 'php', 'php.stub' },
  root_markers = { 'composer.json", '.git' },
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
