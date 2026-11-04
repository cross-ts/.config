-- ☕ Dead simple yet super extensible plugin to center the currently focused buffer to the middle of the screen.
---@type configs.PluginSpec
return {
  'no-neck-pain.nvim',
  src = 'https://github.com/shortcuts/no-neck-pain.nvim',
  cmd = {
    'NoNeckPain',
  },
  -- event = {
  --   'BufNewFile',
  --   'BufReadPre',
  -- },
  -- after = function()
  --   require('no-neck-pain').setup({
  --     autocmds = {
  --       enableOnVimEnter = true,
  --       enableOnTabEnter = true,
  --     }
  --   })
  -- end,
}
