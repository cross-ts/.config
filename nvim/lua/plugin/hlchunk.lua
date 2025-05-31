-- This is the lua implementation of nvim-hlchunk, you can use this neovim plugin to highlight your indent line and the current chunk (context) your cursor stayed
return {
  "shellRaining/hlchunk.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  event = {
    "BufNewFile",
    "BufReadPre",
  },
  opts = {
    chunk = {
      enable = true,
      use_treesitter = true,
      style = {
        ("#%06x"):format(vim.api.nvim_get_hl(0, { name = "Debug" }).fg),
        ("#%06x"):format(vim.api.nvim_get_hl(0, { name = "Error" }).fg),
      },
      duration = 100,
      delay = 100,
    },
    indent = {
      enable = true,
      chars = { "┊" },
      use_treesitter = true,
    },
    line_num = {
      enable = true,
      style = ("#%06x"):format(vim.api.nvim_get_hl(0, { name = "CursorLineNr" }).fg),
      use_treesitter = true,
    },
    blank = {
      enable = true,
      chars = { "⋅" },
    },
  },
}
