return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }, 
    config = function()
        local builtin = require('telescope.builtin')
        require('telescope').setup({
            highlight_groups = {
                TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
                TelescopeNormal = { bg = 'none' },
                TelescopePromptNormal = { bg = 'none' },
                TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
                TelescopeSelection = { fg = 'text', bg = "none" },
            }
        })

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input('Grep > ') });
        end)
    end,
}

