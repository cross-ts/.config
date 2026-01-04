-- Leader Key
vim.g.mapleader = ' '

-- Language Providers
vim.g.python3_host_prog = vim.fn.exepath('python3')
vim.g.ruby_host_prog = vim.fn.exepath('ruby')

-- Disabled Providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Colors
vim.opt.termguicolors = true
vim.opt.guicursor = "i-t:ver25"

-- Indent Settings
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = false

-- Tab Settings
vim.opt.expandtab = true

-- Search Settings
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Split Settings
vim.opt.splitbelow = false
vim.opt.splitright = true

-- Cursor Settings
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.whichwrap = 'b,s,<,>,[,],h,l'

-- Line Settings
vim.opt.number = true
vim.opt.relativenumber = false

-- Command Line Settings
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'

-- Status Line Settings
vim.opt.laststatus = 2
vim.opt.showmode = true

-- Undo Settings
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undodir'

-- colorscheme
vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'NONE' })
vim.api.nvim_set_hl(0, 'NonText', { ctermbg = 'NONE' })
vim.api.nvim_set_hl(0, 'SpecialKey', { ctermbg = 'NONE' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { ctermbg = 'NONE' })

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

-- Lazy Plugin Manager Setup
require('lazy').setup('plugins', {
  defaults = {
    lazy = true,
  },
})
