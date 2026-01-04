vim.filetype.add({
  extension = {
    dockerfile = "dockerfile",
  },

  pattern = {
    ["Dockerfile.*"] = "dockerfile",
  },
})
