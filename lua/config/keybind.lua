
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

-- Remove Arrow Key
keymap.set("", "<up>", "<nop>", { noremap = true })
keymap.set("", "<down>", "<nop>", { noremap = true })
keymap.set("i", "<up>", "<nop>", { noremap = true })
keymap.set("i", "<down>", "<nop>", { noremap = true })

-- Moving around windows using s + h,j,k,l
keymap.set('n', '<leader>h', '<C-w>h')
keymap.set('n', '<leader>j', '<C-w>j')
keymap.set('n', '<leader>k', '<C-w>k')
keymap.set('n', '<leader>l', '<C-w>l')