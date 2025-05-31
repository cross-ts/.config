-- Fully featured & enhanced replacement for copilot.vim complete with API for interacting with Github Copilot
return {
  'zbirenbaum/copilot.lua',
  cmd = {
    'Copilot',
  },
  event = {
    'InsertEnter',
  },
  opts = {
    suggestion = {
      enabled = false,
    },
    panel = {
      enabled = false,
    },
  },
}
