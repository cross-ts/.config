-- Edit and review GitHub issues and pull requests from the comfort of your favorite editor
---@type configs.PluginSpec
return {
  'octo.nvim',
  src = 'https://github.com/pwntester/octo.nvim',
  cmd = {
    'Octo',
  },
  before = function()
    require('lz.n').trigger_load('telescope.nvim')
  end,
  after = function()
    require('octo').setup({})
  end,
}
