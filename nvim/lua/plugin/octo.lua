-- Edit and review GitHub issues and pull requests from the comfort of your favorite editor
return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  cmd = {
    'Octo',
  },
  config = true,
}
