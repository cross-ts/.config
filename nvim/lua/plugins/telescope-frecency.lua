-- A telescope.nvim extension that offers intelligent prioritization when selecting files from your editing history.
---@type configs.PluginSpec
return {
  'telescope-frecency.nvim',
  src = 'https://github.com/nvim-telescope/telescope-frecency.nvim',
  -- telescope.nvim の after で trigger_load する
  lazy = true,
}
