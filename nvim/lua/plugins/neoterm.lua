-- Wrapper of some vim/neovim's :terminal functions.
---@type LazyPluginSpec
return {
  "kassio/neoterm",
  cmd = { "Tnew", "Ttoggle" },
  init = function()
    vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>Tnew<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>tig', '<cmd>Ttoggle<bar>T tig status<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>Ttoggle<cr>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('t', '<leader>tt', '<cmd>Ttoggle<cr>', { noremap = true, silent = true })
  end,
  config = function()
    vim.g.neoterm_default_mod = 'belowright'
    vim.g.neoterm_size = 15
    vim.g.neoterm_autoinsert = 1
    vim.g.neoterm_autojump = 1
  end
}
