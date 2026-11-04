-- Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
---@type configs.PluginSpec
return {
  'copilot.lua',
  src = 'https://github.com/zbirenbaum/copilot.lua',
  cmd = {
    'Copilot',
  },
  event = {
    'InsertEnter',
  },
  after = function()
    require('copilot').setup({
      suggestion = {
        enabled = false,
      },
      panel = {
        enabled = false,
      },
    })
  end,
}
