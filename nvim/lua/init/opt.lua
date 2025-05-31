-- Colors
vim.opt.termguicolors = true

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
