-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = {
    'VimEnter',
  },
  opts = {
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
  },
}
