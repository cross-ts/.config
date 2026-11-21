-- plenary: full; complete; entire; absolute; unqualified. All the lua functions I don't want to write twice.
---@type configs.PluginSpec
return {
  'plenary.nvim',
  src = 'https://github.com/nvim-lua/plenary.nvim',
  -- 複数のプラグインから require されるため起動時にロードする
  lazy = false,
}
