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

-- Thay đổi encoding mặc định của file thành utf-8
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Hiển thị số dòng trong file
vim.opt.nu = true
vim.opt.rnu = true

-- Cài đặt thụt dòng mặc định là 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Thụt dòng tự động khi ấn enter
vim.opt.ai = true
vim.opt.si = true

-- Tự động xuống dòng nếu kí tự trên dòng đó quá dài
vim.opt.wrap = true

vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Giảm thời gian thực thi lệnh xuống 250ms
-- mặc định là 500ms
vim.opt.timeoutlen = 250
vim.opt.timeout = true
vim.opt.updatetime = 250

-- Khi tìm kiếm, không phân biệt chữ hoa, chữ thường
-- Ex: name NaME namE
vim.o.ignorecase = true
vim.o.smartcase = true

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
    }
})

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Keybind
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require("config.keybind")