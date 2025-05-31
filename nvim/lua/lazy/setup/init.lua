-- Install lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })

  local f = io.open(vim.fn.stdpath('config') .. '/lazy-lock.json', 'r')
  if f then
    local data = f:read('*a')
    local lock = vim.json.decode(data)
    vim.fn.system { 'git', '-C', lazypath, 'checkout', lock['lazy.nvim'].commit }
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugin', {
  defaults = {
    lazy = true,
  },
})
