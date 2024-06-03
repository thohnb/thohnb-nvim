
local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"
    local keymap = vim.keymap;
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    -- custom mappings
    keymap.set('n', '<C-t>', api.tree.change_root_to_parent,opts('Up'))
    keymap.set('n', '?',     api.tree.toggle_help,opts('Help'))
    keymap.set('n', '<CR>',  api.node.open.edit,opts('Open'))
  end
  
  -- pass to setup along with your other options
  require("nvim-tree").setup {
    ---
    on_attach = my_on_attach,
    filesystem_watchers = {
      ignore_dirs = {
        "node_modules",
      },
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
    --- Disable GIT
    git = {
      enable = false,
      ignore = true,
    },
  }