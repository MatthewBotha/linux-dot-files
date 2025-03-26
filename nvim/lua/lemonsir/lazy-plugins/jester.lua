return {
    'David-Kunz/jester',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'mfussenegger/nvim-dap',
    },
    config = function()
        require('jester').setup({
            terminal_cmd = ':vsplit | :cd %:h | :cd .. | terminal',
            dap = {
            --     type = 'pwa-node',
                cwd = function()
                    print('testing dap in jester')
                    return vim.fn.getcwd() .. '/' .. vim.fn.expand('%:h:h')
                end,
            },
        })

        -- setup dap
        local dap = require('dap')
        -- dap.adapters['pwa-node'] = {
        --     type = 'server',
        --     host = 'localhost',
        --     port = '${port}',
        --     executable = {
        --         command = 'node',
        --         -- 💀 Make sure to update this path to point to your installation
        --         args = {os.getenv('HOME') .. '/.config/js-debug/src/dapDebugServer.js', '${port}'},
        --     }
        -- }
        -- dap.configurations.javascript = {
        --     {
        --         type = 'pwa-node',
        --         request = 'launch',
        --         name = 'Launch file',
        --         program = '${file}',
        --         cwd = '${workspaceFolder}' .. '/' .. vim.fn.expand('%:h:h'),
        --     },
        -- }
        dap.adapters.node2 = {
            type = 'executable',
            command = 'node',
            args = {os.getenv('HOME') .. '/.config/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
        }
        dap.configurations.javascript = {
            {
                name = 'Launch',
                type = 'node2',
                request = 'launch',
                program = '${file}',
                cwd = function()
                    print('testing dap')
                    return vim.fn.getcwd() .. '/' .. vim.fn.expand('%:h')
                end,
                sourceMaps = true,
                protocol = 'inspector',
                console = 'integratedTerminal',
            },
            {
                -- For this to work you need to make sure the node process is started with the `--inspect` flag.
                name = 'Attach to process',
                type = 'node2',
                request = 'attach',
                processId = require'dap.utils'.pick_process,
            },
        }
    end,
}
