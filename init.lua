vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_disable_default_keybindings = 1

-- Load everything about keybind,nvim ui.. lazy.vim
require("thohnb/core/lazy")
require("thohnb/core/keybind")
require("thohnb/core/config")
