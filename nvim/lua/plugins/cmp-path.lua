-- nvim-cmp source for path
---@type configs.PluginSpec
return {
  'cmp-path',
  src = 'https://github.com/hrsh7th/cmp-path',
  -- nvim-cmp の after で trigger_load する
  lazy = true,
}
