vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.wo.number = true
vim.opt.termguicolors = true
-- Load everything about keybind,nvim ui.. lazy.vim
require("thohnb/core/lazy")
require("thohnb/core/keybind")
require("thohnb/core/config")