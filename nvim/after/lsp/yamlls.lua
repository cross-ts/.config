--- @type vim.lsp.Config
return {
  cmd = { 'mise', 'run', 'lsp:yaml' },
  filetypes = {
    "yaml",
    "yaml.docker-compose",
    "yaml.ghactions",
    "yaml.gitlab",
    "yaml.helm-values",
    "yaml.neon",
  }
}
