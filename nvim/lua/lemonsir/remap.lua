-- jump to current dir listing
vim.keymap.set('n', '<leader>pv', ':Ex<CR>')

-- move highlighted lines
vim.keymap.set('v', '<M-j>', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', '<M-k>', ':m \'<-2<CR>gv=gv')

-- keep half page jump cursor in the middle
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- keep search terms in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- copy to system clipboard
vim.keymap.set('n', '<leader>y', '\'+y')
vim.keymap.set('v', '<leader>y', '\'+y')
vim.keymap.set('n', '<leader>Y', '\'+Y')

-- find-replace current word
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- set current file to executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

