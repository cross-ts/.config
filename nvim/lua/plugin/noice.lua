-- 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
return {
  'folke/noice.nvim',
  enabled = false,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  cmd = {
    'Noice',
    'NoiceAll',
  },
  event = {
    'VeryLazy',
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
  },
}
