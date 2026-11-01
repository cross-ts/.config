--- @type vim.lsp.Config
return {
  settings = {
    json = {
      schemas = {
        {
          fileMatch = {"**/composer.json"},
          url = "https://getcomposer.org/schema.json",
        },
        {
          fileMatch = {"**/{,.}claude/settings{,.local}.json"},
          url = "https://json.schemastore.org/claude-code-settings.json",
        }
      }
    }
  }
}
