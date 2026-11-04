-- File Browser extension for telescope.nvim
---@type configs.PluginSpec
return {
  'telescope-file-browser.nvim',
  src = 'https://github.com/nvim-telescope/telescope-file-browser.nvim',
  -- telescope.nvim の after で trigger_load する
  lazy = true,
}
