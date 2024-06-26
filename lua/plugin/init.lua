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
-- List_Plugins
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
            event = {"InsertEnter", "CmdlineEnter"},
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
                "FelipeLema/cmp-async-path",
                "hrsh7th/cmp-cmdline",
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
                "MunifTanjim/nui.nvim",
                "rcarriga/nvim-notify"
            }
        },
        -- ToggleTerminal
        {
            "akinsho/toggleterm.nvim",
            version = "*",
            config = plugin_config("toggleterm")
        },
        -- Alpha Dashboard
        {
            "goolord/alpha-nvim",
            config = function()
                local alpha = require "alpha"
                local dashboard = require "alpha.themes.dashboard"
                dashboard.section.header.val = {
                    "Hello World"
                }
                dashboard.section.buttons.val = {
                    -- New File
                    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                    dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>")
                    -- Quit
                }
                vim.api.nvim_create_autocmd(
                    "User",
                    {
                        pattern = "AlphaReady",
                        desc = "hide cursor for alpha",
                        callback = function()
                            local hl = vim.api.nvim_get_hl_by_name("Cursor", true)
                            hl.blend = 100
                            vim.api.nvim_set_hl(0, "Cursor", hl)
                            vim.opt.guicursor:append("a:Cursor/lCursor")
                        end
                    }
                )
                vim.api.nvim_create_autocmd(
                    "BufUnload",
                    {
                        buffer = 0,
                        desc = "show cursor after alpha",
                        callback = function()
                            local hl = vim.api.nvim_get_hl_by_name("Cursor", true)
                            hl.blend = 0
                            vim.api.nvim_set_hl(0, "Cursor", hl)
                            vim.opt.guicursor:remove("a:Cursor/lCursor")
                        end
                    }
                )
                alpha.setup(dashboard.config)
            end
        },
        
        -- Highlight Color
        {
            "brenoprata10/nvim-highlight-colors",
            config = function()
                require("nvim-highlight-colors").setup({})
            end
        },
        -- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        {
            "f-person/git-blame.nvim",
            config = function()
                require("gitblame").setup({})
            end
            -- Git Section: For Git
        },
    }
)
