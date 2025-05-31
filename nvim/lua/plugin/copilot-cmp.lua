-- Lua plugin to turn github copilot into a cmp source
return {
  'zbirenbaum/copilot-cmp',
  config = function ()
    require('copilot_cmp').setup()
  end,
}
