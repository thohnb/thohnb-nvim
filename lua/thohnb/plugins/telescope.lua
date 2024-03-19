return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "truncate " },
                file_ignore_patterns = {
                    "node_modules/.*",
                    "%.jpg",
                    "%.png",
                    "yarn.lock",
                    "package-lock.json",
                    "lazy-lock.json",
                    "init.sql",
                    "target/.*",
                    ".git/.*",
                },
                extensions = {
                    file_browser = {
                        theme = "ivy",
                        hijack_netrw = true,
                    },
                }
            },
        })

        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        require("telescope").load_extension "file_browser"
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        
    end,
}
