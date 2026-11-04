-- nvim-cmp source for neovim builtin LSP client
---@type configs.PluginSpec
return {
  'cmp-nvim-lsp',
  src = 'https://github.com/hrsh7th/cmp-nvim-lsp',
  -- nvim-cmp の after で trigger_load する
  lazy = true,
}
