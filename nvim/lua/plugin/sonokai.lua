-- High Contrast & Vivid Color Scheme based on Monokai Pro
return {
  "sainnhe/sonokai",
  init = function()
    vim.opt.termguicolors = true

    vim.g.sonokai_better_performance = 1
    vim.g.sonokai_enable_italic = 0
    vim.g.sonokai_disable_italic_comment = 1
    vim.g.sonokai_disable_terminal_colors = 1
    vim.g.sonokai_transparent_background = 1

    vim.cmd.colorscheme("sonokai")
  end,
}
