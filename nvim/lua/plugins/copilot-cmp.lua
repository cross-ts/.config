-- Lua plugin to turn github copilot into a cmp source
---@type LazyPluginSpec
return {
  'zbirenbaum/copilot-cmp',
  config = function ()
    require('copilot_cmp').setup()
  end,
}
