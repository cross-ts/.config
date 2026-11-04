-- Rainbow delimiters for Neovim with Tree-sitter
---@type configs.PluginSpec
return {
  'rainbow-delimiters.nvim',
  src = 'https://github.com/HiPhish/rainbow-delimiters.nvim',
  event = {
    'BufNewFile',
    'BufReadPre',
  },
}
