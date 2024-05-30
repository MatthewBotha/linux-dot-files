return {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      -- load the color scheme
      vim.cmd([[colorscheme rose-pine]])
    end,
}
