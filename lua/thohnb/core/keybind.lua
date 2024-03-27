-- My keybind
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'w', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'a', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 's', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd', '<Right>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<C-o>', ':e <C-r>=expand("%:p:h")<CR>/', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
-- Jump to other screen
vim.api.nvim_set_keymap('n', 'mw', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'md', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ms', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ma', '<C-w>h', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '@','<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", previewer = false, layout_config = { height = 20,width = 100} })<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'te', ':tabedit<CR>', { noremap = true, silent = true })

-- Define a function to comment a line and switch to normal mode
function comment_and_switch_to_normal_mode()
  -- Switch to normal mode
  vim.api.nvim_input('<C-o>')
  -- Comment the current line using gcc
  vim.api.nvim_input('gcc')
end

-- Map the function to a key binding in insert mode
vim.api.nvim_set_keymap('i', '<c-c>', '<cmd>lua comment_and_switch_to_normal_mode()<CR>', { noremap = true, silent = true })

function goto_line_and_start_insert()
  -- Prompt the user for input
  local line_number = tonumber(vim.fn.input("Jump to line: "))
  if line_number ~= nil then
    -- Go to the specified line number
    vim.fn.cursor(line_number, 0)
    -- Enter insert mode
    vim.cmd('startinsert')
  end
end

-- Set the key mapping for 'js' to call the function
vim.api.nvim_set_keymap('n', 'jt', ':lua goto_line_and_start_insert()<CR>', {noremap = true})


-- TrueZen Minimal
vim.api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})


vim.api.nvim_set_keymap('v', '<C-d>', "y']p", {noremap = true, silent = true})


-- Nvim tree
vim.api.nvim_set_keymap('n','<C-b>',":Neotree toggle<CR>",{noremap= true, silent = true})
-- Search Box
vim.keymap.set('n', '<C-f>', ":lua require('searchbox').match_all({title='Match All', clear_matches=true, default_value=''})<CR>")

-- Replace
vim.keymap.set('n', '<C-r>', ":SearchBoxReplace confirm=menu<CR>")


-- Replace by holding lines in v-mode
vim.keymap.set('v', '<C-r>', "y<cmd>lua require('searchbox').replace({default_value = vim.fn.getreg(vim.v.register)})<CR>")



local MiniMove = require('mini.move')
vim.api.nvim_set_keymap('i', '<M-Down>', '<Cmd>lua MiniMove.move_line("down")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<M-Up>', '<Cmd>lua MiniMove.move_line("up")<CR>', { noremap = true, silent = true })


-- local
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Barbar
-- Move to previous/next
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
-- Map BufferGoto
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Define a function to save the current file, switch to normal mode, and then go back to insert mode
function save_and_switch_to_insert_mode()
  -- Save the current file
  vim.api.nvim_command(':w')
  -- Switch to normal mode
  vim.api.nvim_input('<C-o>')
  -- Go back to insert mode
  vim.api.nvim_input('i')
end

-- Map the function to a key binding in insert mode (C-s)
vim.api.nvim_set_keymap('i', '<C-s>', '<cmd>lua save_and_switch_to_insert_mode()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Space>', '<Space><C-g>u',{ noremap = true, silent = true })
-- Ctrl+z : undo
vim.api.nvim_set_keymap('i', '<C-z>', '<c-g>u<c-u>',{ noremap = true, silent = true })

-- Barbar Tab 
