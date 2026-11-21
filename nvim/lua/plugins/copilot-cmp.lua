-- Lua plugin to turn github copilot into a cmp source
---@type configs.PluginSpec
return {
  'copilot-cmp',
  src = 'https://github.com/zbirenbaum/copilot-cmp',
  -- nvim-cmp の after で trigger_load する
  lazy = true,
  after = function ()
    require('copilot_cmp').setup()
  end,
}
