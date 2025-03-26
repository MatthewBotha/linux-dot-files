-- jump to current dir listing **Redundant with oil**
-- vim.keymap.set('n', '<leader>pv', ':Ex<CR>')

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

-- keyword lookup
vim.keymap.set('i', '<C-Space>', 'K')

-- set current file to executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- jester navigation
vim.keymap.set('n', '<leader>rt', function() require("jester").run() end) -- run test under cursor
vim.keymap.set('n', '<leader>rf', function() require("jester").run_file() end) -- run current file
vim.keymap.set('n', '<leader>dt', function() require("jester").debug() end) -- debug test under cursor
vim.keymap.set('n', '<leader>df', function() require("jester").debug_file() end) -- debug current file

-- diagnostic navigation
vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float(0, {scope = "line"}) end)

vim.keymap.set('n', '<leader>dn', function() vim.diagnostic.goto_next() end)
vim.keymap.set('n', '<leader>du', function() vim.diagnostic.goto_prev() end)
