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
        require("config." .. module)
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
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.cmdheight = 0
vim.opt.cursorline = true
-- Neovim Number
vim.o.number = true
vim.o.relativenumber = true
-- Disable Keyboard
vim.opt.mouse = ""
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Lazy.nvim Bootstrap
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Load plugins file
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require("lazy").setup(
    {
        -- Theme Gruvbox
        {
            "ellisonleao/gruvbox.nvim",
            priority = 1000,
            config = plugin_config("colorscheme")
        },
        -- LuaLine
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {"nvim-tree/nvim-web-devicons"},
            config = plugin_config("lualine")
        },
        --
        {
            "akinsho/bufferline.nvim",
            version = "*",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
                "echasnovski/mini.bufremove" -- Remove Bufferline
            },
            config = plugin_config("bufferline")
        },
        -- Nvim-Tree
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons"
            },
            config = plugin_config("nvimtree")
        },
        -- TreeSitter
        {
            "nvim-treesitter/nvim-treesitter",
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
            dependencies = {
                "neovim/nvim-lspconfig",
                "nvimdev/lspsaga.nvim"
            },
            config = plugin_config("lspconfig")
        },
        -- Nvim-Cmp
        {
            "hrsh7th/nvim-cmp",
            lazy = true,
            event = { "InsertEnter", "CmdlineEnter" },
            dependencies = {
                -- Require
                "hrsh7th/cmp-buffer", -- source for text in buffer
                "hrsh7th/cmp-path", -- source for file system paths
                {
                    "L3MON4D3/LuaSnip",
                    -- follow latest release.
                    version = "v2.*" -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                },
                "saadparwaiz1/cmp_luasnip", -- for autocompletion
                "rafamadriz/friendly-snippets", -- useful snippets
                "onsails/lspkind.nvim", -- vs-code like pictograms
                "petertriho/cmp-git", -- Git
                "FelipeLema/cmp-async-path",
                "hrsh7th/cmp-cmdline",
                "dmitmel/cmp-cmdline-history",
                "hrsh7th/cmp-emoji", -- Emoji,
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lsp-signature-help"
            },
            config = plugin_config("nvim-cmp")
        },
        -- Indent Blank-line
        {"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}},
        -- Ultimate Pair
        {
            "altermo/ultimate-autopair.nvim",
            event = {"InsertEnter", "CmdlineEnter"},
            branch = "v0.6", --recommended as each new version will have breaking changes
            opts = {}
        },
        -- Snap
        {
            "camspiers/snap",
            config = function()
                -- Basic example config
                local snap = require "snap"
                snap.maps {
                    {
                        "<Leader><Leader>",
                        function()
                            snap.run {
                                producer = snap.get "consumer.limit"(10000, snap.get "producer.ripgrep.vimgrep"),
                                select = snap.get "select.vimgrep".select,
                                multiselect = snap.get "select.vimgrep".multiselect,
                                views = {snap.get "preview.vimgrep"}
                            }
                        end
                    }
                }
            end
        },
        -- Noice.nvim
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            opts = {},
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify"
            }
        },
         -- ToggleTerminal
    {'akinsho/toggleterm.nvim', version = "*", config = plugin_config("toggleterm")
},
    -- Alpha Dashboard
    {
        "goolord/alpha-nvim",
        config = function ()
            local alpha = require'alpha'
            local dashboard = require'alpha.themes.dashboard'
            dashboard.section.header.val = {
                "Hello World"
            }
            dashboard.section.buttons.val = {
                -- New File
                dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
                dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
                -- Quit
            }
            vim.api.nvim_create_autocmd('User', {
                pattern = 'AlphaReady',
                desc = 'hide cursor for alpha',
                callback = function()
                  local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
                  hl.blend = 100
                  vim.api.nvim_set_hl(0, 'Cursor', hl)
                  vim.opt.guicursor:append('a:Cursor/lCursor')
                end,
              })
              vim.api.nvim_create_autocmd('BufUnload', {
                buffer = 0,
                desc = 'show cursor after alpha',
                callback = function()
                  local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
                  hl.blend = 0
                  vim.api.nvim_set_hl(0, 'Cursor', hl)
                  vim.opt.guicursor:remove('a:Cursor/lCursor')
                end,
              })
            alpha.setup(dashboard.config)
        end
    };
    -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Epxerience Zone: For testing purpose -> if good -> put to plugins zone
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
          { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
          { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
          { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
          { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
          { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
      },
      -- Highlight Color
      {
        'brenoprata10/nvim-highlight-colors',
        config = function() 
            require('nvim-highlight-colors').setup({})
        end
      }
}

   

)

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Keybind
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
require("config.keybind")
