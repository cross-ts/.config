-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
---@type LazyPluginSpec
return {
  "mason-org/mason-lspconfig.nvim",
  enabled = false,
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  }
}
