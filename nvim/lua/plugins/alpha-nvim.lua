-- a lua powered greeter like vim-startify / dashboard-nvim
---@type configs.PluginSpec
return {
  'alpha-nvim',
  src = 'https://github.com/goolord/alpha-nvim',
  event = {
   'VimEnter',
  },
  after = function ()
    local alpha = require('alpha')
    local theta = require('alpha.themes.theta')
    theta.file_icons.provider = 'devicons'
    alpha.setup(theta.config)
  end
}
