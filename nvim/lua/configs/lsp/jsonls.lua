--- @type vim.lsp.Config
return {
  settings = {
    json = {
      schemas = {
        {fileMatch = {"composer.json"}, url = "https://getcomposer.org/schema.json"},
      }
    }
  }
}
