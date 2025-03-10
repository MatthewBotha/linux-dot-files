return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            -- load the color scheme
            require('rose-pine').setup({
                variant = 'moon', -- auto, main, moon, or dawn
                dim_inative_windows = true,
                extend_background_behind_borders = true,
                highlight_groups = {
                    TelescopeBorder = { fg = 'highlight_high', bg = '' },
                    TelescopeNormal = { bg = 'none' },
                    TelescopePromptNormal = { bg = 'none' },
                    TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
                    TelescopeSelection = { fg = 'text', bg = 'none' },
                    TelescopeSelectionCaret = { fg = 'rose', bg = 'none' },
                    NormalNC = { fg = 'subtle', bg = 'none' },
                    Whitespace = { fg = 'highlight_low' },
                    TrailingWhitespace = { fg = 'rose', bg = 'rose' }
                }
            })
            vim.cmd('colorscheme rose-pine-moon')

            -- TrailingWhitespace highlight group
            -- vim.api.nvim_create_autocmd('BufEnter', {
            --    pattern = '*',
            --    command = [[
            --    syntax clear TrailingWhitespace |
            --    syntax match TrailingWhitespace "\_s\+$"
            --    ]]
            --})

            -- transparent background
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
        end,
    }, --[[
    {
        'maxmx03/roseline',
        dependencies = {
            'rose-pine/neovim',
            'lewis6991/gitsigns.nvim',
        },
        config = function()
            require('gitsigns').setup()
            require('roseline').setup({
                theme = 'rose-pine',
                layout = {
                    a = section_a,
                    b = section_b,
                    c = section_c,
                    d = section_d,
                    e = section_e,
                },
                icons = {
                    vim = '',
                    git = {
                        head = '',
                        added = '',
                        changed = '',
                        removed = '',
                    },
                    diagnostic = {
                        Error = '',
                        Warning = '',
                        Information = '',
                        Question = '',
                        Hint = '󰌶',
                        Debug = '',
                        Ok = '󰧱',
                    },
                    os = {
                        Linux = '',
                        microsoft = '',
                        Darwin = '',
                    },
                    default = { left = '', right = '' },
                    block = { left = '█', right = '█' },
                    round = { left = '', right = '' },
                },
            })
        end,
    } ]]
}
