-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
---@type configs.PluginSpec
return {
  'lualine.nvim',
  src = 'https://github.com/nvim-lualine/lualine.nvim',
  event = {
    'VimEnter',
  },
  after = function()
    require('lualine').setup({
      options = {
        disabled_filetypes = {
          statusline = {
            'no-neck-pain',
          },
          winbar = {
            'no-neck-pain',
          },
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    })
  end,
}
