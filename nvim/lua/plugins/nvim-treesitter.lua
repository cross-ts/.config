-- Nvim Treesitter configurations and abstraction layer
---@type LazyPluginSpec
return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context',
    'RRethy/nvim-treesitter-endwise',
  },
  lazy = false,
  config = function()
    require('nvim-treesitter.config').setup({})
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end
}
