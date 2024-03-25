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
vim.api.nvim_set_keymap('n', 'jw', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'jd', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'js', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ja', '<C-w>h', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '@','<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", previewer = false, layout_config = { height = 20,width = 100} })<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'te', ':tabedit<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<c-t>", function()
  vim.cmd(":belowright vsplit | term")
  vim.cmd("startinsert")
end)

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
vim.api.nvim_set_keymap('n','<C-b>',":Neotree<CR>",{noremap= true, silent = true})
-- Search Box
vim.keymap.set('n', '<C-f>', ":lua require('searchbox').match_all({title='Match All', clear_matches=true, default_value=''})<CR>")

-- Replace
vim.keymap.set('n', '<C-r>', ":SearchBoxReplace confirm=menu<CR>")


-- Replace by holding lines in v-mode
vim.keymap.set('v', '<C-r>', "y<cmd>lua require('searchbox').replace({default_value = vim.fn.getreg(vim.v.register)})<CR>")
