return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-tree/nvim-web-devicons",
        "princejoogie/dir-telescope.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local dir = require("dir-telescope")
        telescope.setup({

            defaults = {
                path_display = { "truncate" },
                selection_caret = " ❯ ",
                entry_prefix = "   ",
                file_ignore_patterns = {
                    "node_modules/.*",
                    "%.jpg",
                    "%.png",
                    "yarn.lock",
                    "package-lock.json",
                    "lazy-lock.json",
                    "init.sql",
                    "target/.*",
                    ".git/.*"
                },
                defaults = {
                    borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
                  },
                extensions = {
                    file_browser = {
                        theme = "ivy",
                        hijack_netrw = true
                    },
                    
                }
            }
        })
        -- Set up dir-telescope
        dir.setup({
            hidden = true,
            no_ignore = false,
            show_preview = true
        })
        
        -- Set keymaps
        local keymap = vim.keymap -- for conciseness

    end
}
