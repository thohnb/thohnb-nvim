
local keymap = vim.keymap
local tree = require("nvim-tree.api")
-- ~~
-- Keymap: 'mode' , 'keybind','<command'>
-- ~~
-- Nvimtree Toggle

keymap.set('n','<leader>t','<cmd>NvimTreeToggle<cr>')
-- BufferLine Switch to Next Tab
keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>')

-- duplicate line
keymap.set('n', '<C-d>', 'mzyyp`z')
keymap.set('i', '<C-d>', '<Esc>mzyyp`za')