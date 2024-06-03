-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Pre-Require Install:
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- ripgrep
-- NPM
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Function Config: Plugin_Config
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Cách dùng: plugins/<plugins_name.lua>
local function plugin_config(module)
    return function()
        require('config.' .. module)
    end
end

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Lazy.nvim Options
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Trong neovim, kí tự \ mặc định được gọi là <leader>
-- tuy nhiên, vì nó quá xa để nhấn, nên ae dev hay đổi kí tự này
-- sang kí tự <space> để gần hơn
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Lazy.nvim Bootstrap
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Load plugins file
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require("lazy").setup ({
    -- Theme Gruvbox
    {
        "ellisonleao/gruvbox.nvim",priority = 1000,
        config = plugin_config("colorscheme"),
    },
    -- LuaLine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = plugin_config("lualine")
    },
    -- Nvim-Tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
          "nvim-tree/nvim-web-devicons",
        },
        config = plugin_config("nvimtree")
    },
    -- TreeSitter
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        build = ":TSUpdate",
            config = plugin_config("treesitter")
    },
    -- Mason
    {
        "williamboman/mason.nvim",
        config = plugin_config("mason")
    },
    -- LSP
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies= {            
            "neovim/nvim-lspconfig",
        },
        config = plugin_config("lspconfig")
    }
    
})

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Keybind
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require("config.keybind")