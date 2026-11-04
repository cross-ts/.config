-- markdown preview plugin for (neo)vim
---@type configs.PluginSpec
return {
  "markdown-preview.nvim",
  src = "https://github.com/iamcco/markdown-preview.nvim",
  cmd = {
    "MarkdownPreviewToggle",
    "MarkdownPreview",
    "MarkdownPreviewStop",
  },
  build = "cd app && npm install",
  beforeAll = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}
