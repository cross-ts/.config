--- @type vim.lsp.Config
return {
  cmd = { 'mise', 'run', 'lsp:bash' },
  filetypes = { 'sh', 'bash', 'zsh' },
}
