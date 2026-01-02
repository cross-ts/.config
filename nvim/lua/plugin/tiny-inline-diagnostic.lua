-- A Neovim plugin that display prettier diagnostic messages. Display diagnostic messages where the cursor is, with icons and colors.
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require('tiny-inline-diagnostic').setup({
      options = {
        multilines = { enabled = true },
        show_source = { enabled = true },
      },
    })
    vim.diagnostic.config({ virtual_text = false })
  end,
}
