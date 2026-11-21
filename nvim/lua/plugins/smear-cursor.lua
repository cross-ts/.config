-- 🌠 Neovim plugin to animate the cursor with a smear effect in all terminals
---@type configs.PluginSpec
return {
  "smear-cursor.nvim",
  src = "https://github.com/sphamba/smear-cursor.nvim",
  cmd = {
    "SmearCursorToggle",
  },
  event = {
    "VimEnter",
  },
  after = function()
    require("smear_cursor").setup({})
  end,
}
