-- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
---@type configs.PluginSpec
return {
  'nvim-ts-context-commentstring',
  src = 'https://github.com/JoosepAlviste/nvim-ts-context-commentstring',
  lazy = true,
  after = function()
    require('ts_context_commentstring').setup({
      enable_autocmd = false,
    })
  end,
}
