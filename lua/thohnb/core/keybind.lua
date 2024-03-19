
local notify = require("notify")
vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'w', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'a', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 's', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd', '<Right>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'sl', ':vnew%:p:h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sk', ':new%:p:h<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-n>', ':enew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-o>', ':e <C-r>=expand("%:p:h")<CR>/', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'mw', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'md', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ms', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ma', '<C-w>h', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '@','<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", previewer = false, layout_config = { height = 40} })<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n','<leader>cp',"<cmd>MarkdownPreviewToggle<cr>",{noremap = true, silent = true})

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

vim.api.nvim_set_keymap('n', 'te', ':tabedit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
vim.api.nvim_set_keymap('n', '<C-w>', '<cmd>BufferLineCloseTab<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n','<C-o>','<cmd>CdProject<CR>',{noremap=true,silent=true})

function SearchAndHighlight()
  -- Prompt the user for input using Vim's built-in input function
  local search_term = vim.fn.input("Enter search term: ")

  -- Check if search term is empty
  if search_term == "" then
    -- Display notification
    notify("Please don't leave the search empty! Please check again.", "error")

    -- Close the search input prompt
    vim.cmd("stopinsert")
    return
  end

  -- Clear any existing search highlights
  vim.cmd("nohlsearch")

  -- Search for the entered term and highlight matches
  vim.cmd("let @/ = '" .. search_term .. "'")
  
  -- Set up a mapping to move to the next match on Enter
  vim.api.nvim_set_keymap('n', '<CR>', ':lua MoveToNextMatch()<CR>', { noremap = true, silent = true })
  
  -- Move to the first match
  MoveToNextMatch()
end

function MoveToNextMatch()
  -- Use pcall to catch errors
  local success, msg = pcall(function() vim.cmd("normal! n") end)

  -- If the command was not successful, display a notification
  if not success then
    notify("Pattern not found!", "error")
  end
end

-- Set up the initial key mapping for Ctrl+F
vim.api.nvim_set_keymap('n', '<C-f>', ':lua SearchAndHighlight()<CR>', { noremap = true, silent = true })
