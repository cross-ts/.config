--- @type vim.lsp.Config
return {
  filetypes = {
    "yaml",
    "yaml.docker-compose",
    "yaml.github-actions",
    "yaml.neon",
  },
  settings = {
    yaml = {
      schemas = {
        -- @see https://github.com/dependabot/dependabot-core/issues/1927
        ["https://json.schemastore.org/dependabot-2.0.json"] = {
          "**/.github/dependabot.yml"
        },
        ["https://json.schemastore.org/github-workflow.json"] = {
          "**/.github/workflows/*.yml",
          "**/.github/workflows/*.yaml",
        },
        ["https://json.schemastore.org/github-action.json"] = {
          "**/action.yml",
          "**/action.yaml",
        },
        -- @see https://docs.docker.com/compose/bridge/customize/#input-model
        ["https://raw.githubusercontent.com/compose-spec/compose-go/refs/heads/main/schema/compose-spec.json"] = {
          "**/compose.yml",
          "**/compose.yaml",
          "**/docker-compose.yml",
          "**/docker-compose.yaml",
        },
      }
    }
  }
}
