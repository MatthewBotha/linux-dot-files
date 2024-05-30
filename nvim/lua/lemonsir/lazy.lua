-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- init lazy
require("lazy").setup({
  -- plugins
  -- telescope
  { "nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim" }, },
  
  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },

  -- treesitter context
  "nvim-treesitter/nvim-treesitter-context",

  -- harpoon
  "theprimeagen/harpoon",
  
  -- undotree
  

  -- lsp
  

  -- rose-pine theme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      -- load the color scheme
      vim.cmd([[colorscheme rose-pine]])
    end,
  }
  }, {
  -- options

  })
