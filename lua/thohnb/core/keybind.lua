


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

vim.api.nvim_set_keymap('n', '@','<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h",respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40} })<cr>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n','<leader>cp',"<cmd>MarkdownPreviewToggle<cr>",{noremap = true, silent = true})

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

vim.api.nvim_set_keymap('n', 'te', ':tabedit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
vim.api.nvim_set_keymap('n', '<C-w>', '<cmd>BufferLineCloseTab<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-f>', ':lua require("telescope.builtin").live_grep()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n','<C-o>','<cmd>CdProject<CR>',{noremap=true,silent=true})

function CdProjectAddCurrentDir()
  local current_file_directory = vim.fn.expand('%:p:h')
  CdProjectAdd(current_file_directory)
end

function CdProjectAdd(directory)
  local projects_config_filepath = vim.fn.stdpath("config") .. "/cd-project.nvim.json"
  local file = io.open(projects_config_filepath, "r")
  local content = file:read("*all")
  file:close()

  local projects = content ~= "" and vim.fn.json_decode(content) or {}

  local project = {}
  project["path"] = directory
  project["name"] = directory:match("([^/\\]*)$")

  for _, existing_project in ipairs(projects) do
    if existing_project["path"] == project["path"] then
      require("notify")("Project already exists: " .. project["path"], 'Notice')
      return
    end
  end

  table.insert(projects, project)

  local new_content = vim.fn.json_encode(projects)

  file = io.open(projects_config_filepath, "w")
  file:write(new_content)
  file:close()

  require("notify")("Project is saved: " .. project["path"] .. " as " .. project["name"], 'Notice')
end

vim.api.nvim_set_keymap('n', 'pa', '<cmd>lua CdProjectAddCurrentDir()<CR>', {noremap=true, silent=true})