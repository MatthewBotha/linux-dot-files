return {
    {
        'stevearc/oil.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('oil').setup {
                columns = { 'icon' },
                keymaps = {
                    -- remove some defaults
                    ['<C-p>'] = false, -- "actions.preview",
                    ['<C-h>'] = false, -- { "actions.select", opts = { horizontal = true } },

                    -- custom keymaps
                    ['<CM-p>'] = 'action.preview',
                    -- ['<leader>lg'] = '<cmd>LazyGit<cr>',
                },
                view_options = {
                    show_hidden = true,
                },
                win_options = {
                    signcolumn = "yes:2",
                }
            }

            -- Open parent directory in current window
            vim.keymap.set('n', '<leader>-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

            -- open parent directoy in floating window
            vim.keymap.set('n', '-', require('oil').toggle_float)
        end,
    },
}
