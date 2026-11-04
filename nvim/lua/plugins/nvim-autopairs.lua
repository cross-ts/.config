-- autopairs for neovim written in lua
---@type configs.PluginSpec
return {
  'nvim-autopairs',
  src = 'https://github.com/windwp/nvim-autopairs',
  event = "InsertEnter",
  after = function()
    require('nvim-autopairs').setup({})
  end,
}
