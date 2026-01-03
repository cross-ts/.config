-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  }
}
