-- nvim-cmp source for buffer words
---@type configs.PluginSpec
return {
  'cmp-buffer',
  src = 'https://github.com/hrsh7th/cmp-buffer',
  -- nvim-cmp の after で trigger_load する
  lazy = true,
}
