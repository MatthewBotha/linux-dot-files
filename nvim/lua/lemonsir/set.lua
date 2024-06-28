-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- long undo tree
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'

-- search highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colors
vim.opt.termguicolors = true

-- scroll padding
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

-- fast update
vim.opt.updatetime = 50

-- color column 80
vim.opt.colorcolumn = '80'

-- vim leader mapping
vim.g.mapleader = ' '

-- clipboard
vim.opt.clipboard = 'unnamedplus'
