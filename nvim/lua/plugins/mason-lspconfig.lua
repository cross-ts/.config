-- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
---@type configs.PluginSpec
return {
  "mason-lspconfig.nvim",
  src = "https://github.com/mason-org/mason-lspconfig.nvim",
  enabled = false,
  lazy = true,
  before = function()
    require("lz.n").trigger_load({ "mason.nvim", "nvim-lspconfig" })
  end,
  after = function()
    require("mason-lspconfig").setup({})
  end,
}
