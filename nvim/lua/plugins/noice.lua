-- 💥 Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
---@type configs.PluginSpec
return {
  'noice.nvim',
  src = 'https://github.com/folke/noice.nvim',
  enabled = false,
  cmd = {
    'Noice',
    'NoiceAll',
  },
  event = {
    'DeferredUIEnter',
  },
  before = function()
    require('lz.n').trigger_load('nui.nvim')
  end,
  after = function()
    require('noice').setup({
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
    })
  end,
}
