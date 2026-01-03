-- 🌠 Neovim plugin to animate the cursor with a smear effect in all terminals
---@type LazyPluginSpec
return {
  "sphamba/smear-cursor.nvim",
  cmd = {
    "SmearCursorToggle",
  },
  event = {
    "VimEnter",
  },
  opts = {},
}
