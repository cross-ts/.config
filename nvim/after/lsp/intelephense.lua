--- @type vim.lsp.Config
return {
  cmd = { 'mise', 'run', '-q', 'lsp:php' },
  filetypes = { 'php', 'php.stub' },
}
