-- Keymap Settings
--- Normal Mode
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'y$', 'Y', { noremap = true })

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<up>', 'gk', { noremap = true })

vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', { noremap = true })

--- Insert Mode
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true, silent = true })

--- Terminal Mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
