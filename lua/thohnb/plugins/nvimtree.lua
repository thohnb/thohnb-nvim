return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },


-- Bind the custom keybinding
vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>lua open_node_in_tab()<CR>', { noremap = true})
            -- Set keybinds
            vim.keymap.set('n', '<CR>', api.node.open.tab, opts('Open: New Tab'))
            vim.keymap.set('n', '<C-n>', api.fs.create, opts('Create File Or Directory'))
            vim.keymap.set('n', '<C-f>', api.live_filter.start, opts('Live Filter: Start'))
            vim.keymap.set('n', '<C-d>', api.fs.remove, opts('Delete'))
        end

        require("nvim-tree").setup {
            -- Call the on_attach function to add key mappings when connecting buffers
            on_attach = my_on_attach,
            update_focused_file = {
                enable = true,
                update_root = true,
            },
                actions = {
                    open_file = {
                        quit_on_open = true,
                    -- Configuration for git
                    window_picker = {
                        enable = true,
                        picker = "default",
                        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                        exclude = {
                          filetype = { "NvimTree", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                          buftype = { "nofile", "terminal", "help" },
                        },
                      },
                    },
                    
                },
                live_filter = {
                    prefix = "[Search]: ",
                    always_show_folders = true,
                  },
                  update_focused_file = { enable = true, },
            git = {
                enable = true, -- Enable git features
            },
            update_cwd = true,
            -- Configuration for filters
            filters = {
                dotfiles = false,
                git_clean = false,
                no_buffer = false,
                custom = {},
                exclude = {},
            },
        }
    end,
}
