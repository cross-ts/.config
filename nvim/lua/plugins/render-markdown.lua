-- Plugin to improve viewing Markdown files in Neovim
---@type configs.PluginSpec
return {
  'render-markdown.nvim',
  src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  ft = {
    'markdown',
  },
  cmd = {
    'RenderMarkdown',
  },
  after = function()
    require('render-markdown').setup({
      enabled = false,
    })
  end,
}
