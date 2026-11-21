-- nvim-cmp source for vim's cmdline
---@type configs.PluginSpec
return {
  'cmp-cmdline',
  src = 'https://github.com/hrsh7th/cmp-cmdline',
  -- nvim-cmp の after で trigger_load する
  lazy = true,
}
