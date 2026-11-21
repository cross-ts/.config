-- Auto-Focusing and Auto-Resizing Splits/Windows for Neovim written in Lua. A full suite of window management enhancements. Vim splits on steroids!
---@type configs.PluginSpec
return {
  'focus.nvim',
  src = 'https://github.com/nvim-focus/focus.nvim',
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  after = function()
    require('focus').setup({})
  end,
}
