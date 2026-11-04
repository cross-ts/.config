-- 👌 Support for --remote and friends.
---@type configs.PluginSpec
return {
  'neovim-remote',
  src = 'https://github.com/mhinz/neovim-remote',
  event = 'TermOpen',
  build = function()
    vim.fn.system('brew require neovim-remote')
  end,
  beforeAll = function()
    vim.env.GIT_EDITOR = 'nvr --remote-wait'
    vim.env.VISUAL = 'nvr --remote-wait'
  end,
  after = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'gitcommit,gitrebase,gitconfig',
      callback = function()
        vim.bo.bufhidden = 'delete'
      end,
    })
  end,
}
