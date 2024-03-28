-- Config
local opt = vim.opt -- for conciseness
-- Set theme
vim.cmd [[colorscheme gruvbox]]
-- Enable Colorizer
vim.cmd([[ColorizerToggle]])
-- Disable barbar autosetup
vim.g.barbar_auto_setup = false -- disable auto-setup
-- line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
-- Set keymodel
vim.o.keymodel = "startsel"
-- Set default encoding
opt.encoding = "utf-8"

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.hlsearch = true --highlight search results
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- Enable mouse support
opt.mouse = "a"

-- Enable background buffers
opt.hidden = true
-- Remember N lines in history
opt.history = 1000
-- Faster scrolling
opt.lazyredraw = false

-- appearance
-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace


-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word
-- Set timeout

opt.timeoutlen = 1000
-- url fix: https://github.com/ChristianChiarulli/nvim/issues/30
opt.ttimeoutlen = 0
-- Show line that cursor currently in
vim.opt.cursorline = false

-- Auto Dir = auto set dir when open from terminal
opt.autochdir = true
-- Set update_in insert
vim.api.nvim_buf_set_option(0, 'modifiable', true)
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = {
            spacing = 5,
            severity_limit = 'Warning',
        },
        update_in_insert = true,
    }
)
-- Word Wrap

vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.list = false -- extra option I set in addition to the ones in your question

-- Git Sign color change
vim.cmd[[ highlight gitsignscurrentlineblame guifg=white]]
vim.g.nvim_tree_auto_close = 0
