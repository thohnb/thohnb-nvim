return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-tree/nvim-web-devicons",
        "princejoogie/dir-telescope.nvim",
        "smartpde/telescope-recent-files"
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local dir = require("dir-telescope")
        telescope.setup({
            defaults = {
                path_display = { "truncate" },
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
        require("telescope").load_extension "file_browser"
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
        keymap.set("n", "<leader>fd", "<cmd>GrepInDirectory<CR>", { noremap = true, silent = true })
        keymap.set("n", "<leader>pd", "<cmd>FileInDirectory<CR>", { noremap = true, silent = true })


    end
}
