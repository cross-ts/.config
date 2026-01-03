-- Nvim Treesitter configurations and abstraction layer
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-context',
    'RRethy/nvim-treesitter-endwise',
  },
  build = ":TSUpdate",
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {},
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },

      -- Plugins
      endwise = { enable = true },
    })
  end,
}
