-- a lua powered greeter like vim-startify / dashboard-nvim
return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = {
   'VimEnter',
  },
  config = function ()
    local alpha = require('alpha')
    local theta = require('alpha.themes.theta')
    theta.file_icons.provider = 'devicons'
    alpha.setup(theta.config)
  end
}
