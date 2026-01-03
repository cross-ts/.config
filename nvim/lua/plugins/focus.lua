-- Auto-Focusing and Auto-Resizing Splits/Windows for Neovim written in Lua. A full suite of window management enhancements. Vim splits on steroids!
---@type LazyPluginSpec
return {
  'nvim-focus/focus.nvim',
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  config = true,
}
