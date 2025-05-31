vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.stub",
  callback = function()
    vim.bo.filetype = "php"
  end,
})
