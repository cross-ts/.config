-- High Contrast & Vivid Color Scheme based on Monokai Pro
return {
  "sainnhe/sonokai",
  init = function()
    vim.g.sonokai_enable_italic = false
    vim.g.sonokai_better_performance = 1

    vim.cmd.colorscheme("sonokai")
  end,
}
