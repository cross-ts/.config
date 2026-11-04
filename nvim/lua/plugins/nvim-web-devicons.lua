-- Provides Nerd Font icons (glyphs) for use by neovim plugins
---@type configs.PluginSpec
return {
  'nvim-web-devicons',
  src = 'https://github.com/nvim-tree/nvim-web-devicons',
  -- 複数のプラグインから require されるため起動時にロードする
  lazy = false,
  after = function()
    require('nvim-web-devicons').setup({
      default = true,
      strict = true,
    })
  end,
}
