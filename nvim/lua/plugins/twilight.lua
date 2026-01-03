-- 🌅 Twilight is a Lua plugin for Neovim 0.5 that dims inactive portions of the code you're editing using TreeSitter.
return {
  "folke/twilight.nvim",
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  cmd = {
    "Twilight",
    "TwilightEnable",
    "TwilightDisable",
  },
  opts = {},
}
