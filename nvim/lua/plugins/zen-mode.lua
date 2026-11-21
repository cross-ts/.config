-- 🧘 Distraction-free coding for Neovim
---@type configs.PluginSpec
return {
  "zen-mode.nvim",
  src = "https://github.com/folke/zen-mode.nvim",
  cmd = { "ZenMode" },
  before = function()
    require("lz.n").trigger_load("twilight.nvim")
  end,
  after = function()
    require("zen-mode").setup({})
  end,
}
