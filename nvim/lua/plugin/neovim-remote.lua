-- 👌 Support for --remote and friends.
return {
  'mhinz/neovim-remote',
  event = 'TermOpen',
  build = function()
    vim.fn.system('brew require neovim-remote')
  end,
  init = function()
    vim.env.GIT_EDITOR = 'nvr --remote-wait'
    vim.env.VISUAL = 'nvr --remote-wait'
  end,
  config = function()
    vim.api.nvim_create_autocmd('Filetype', {
      pattern = 'gitcommit,gitrebase,gitconfig',
      callback = function()
        vim.bo.bufhidden = 'delete'
      end,
    })
  end,
}
