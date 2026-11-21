-- vscode-like pictograms for neovim lsp completion items
---@type configs.PluginSpec
return {
  'lspkind.nvim',
  src = 'https://github.com/onsails/lspkind.nvim',
  -- nvim-cmp の after で trigger_load する
  lazy = true,
}
