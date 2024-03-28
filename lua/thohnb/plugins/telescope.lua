return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-tree/nvim-web-devicons",
        "princejoogie/dir-telescope.nvim",
        "jvgrootveld/telescope-zoxide",
        "smartpde/telescope-recent-files"
        
    },
    config = function()
        local telescope = require("telescope")
        require("telescope").load_extension("recent_files")
        local dir = require("dir-telescope")
	      local actions = require("telescope.actions")
        local z_utils = require("telescope._extensions.zoxide.utils")
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
                    -- Zodie
                    zoxide = {
                        prompt_title = "[ Walking on the shoulders of TJ ]",
                        mappings = {
                          default = {
                            after_action = function(selection)
                              print("Update to (" .. selection.z_score .. ") " .. selection.path)
                            end
                          },
                          ["<C-s>"] = {
                            before_action = function(selection) print("before C-s") end,
                            action = function(selection)
                              vim.cmd.edit(selection.path)
                            end
                          },
                          -- Opens the selected entry in a new split
                          ["<C-q>"] = { action = z_utils.create_basic_command("split") },
                        },
                      }
                    
                }
            }
        })
        -- Set up dir-telescope
        dir.setup({
            hidden = true,
            no_ignore = false,
            show_preview = true
        })
        require("telescope").load_extension('zoxide')
        -- Set keymaps
        local keymap = vim.keymap -- for conciseness
        vim.keymap.set("n", "<leader>cd", telescope.extensions.zoxide.list)
        -- Keybind load recent file
        vim.api.nvim_set_keymap("n", "<Leader><Leader>",
        [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
        {noremap = true, silent = true})
        
    end
}
