--- @type vim.lsp.Config
return {
  filetypes = {
    "yaml",
    "yaml.docker-compose",
    "yaml.github-actions",
    "yaml.gitlab",
    "yaml.helm-values",
    "yaml.neon",
  },
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/dependabot-2.0.json"] = ".github/dependabot.yml",
        ["https://json.schemastore.org/github-workflow.json"] = {
          ".github/workflows/*.yml",
          ".github/workflows/*.yaml",
        },
        ["https://json.schemastore.org/github-action.json"] = {
          "action.yml",
          "action.yaml",
        },
        ["https://raw.githubusercontent.com/compose-spec/compose-go/refs/heads/main/schema/compose-spec.json"] = {
          "compose.yml",
          "compose.yaml",
          "docker-compose.yml",
          "docker-compose.yaml",
        },
      }
    }
  }
}
