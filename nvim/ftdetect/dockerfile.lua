vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = {
    "*.dockerfile",
    "Dockerfile.*"
  },
  callback = function()
    vim.bo.filetype = "dockerfile"
  end,
})
