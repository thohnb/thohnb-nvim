
-- Cursor show that line
vim.opt.cursorline = true
-- Override  sessions
vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
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
-- url fix: https://github.com/ChristianChiarulli/nvim/issues/30
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.o.showtabline = 2
-- auto dir
vim.opt.autochdir = true

-- Set keymodel to startsel,stopse
vim.o.keymodel = "startsel"
vim.api.nvim_command('set clipboard=unnamedplus')
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

vim.cmd([[ColorizerToggle]])

vim.g.transparent_enabled = true
vim.g.barbar_auto_setup = false -- disable auto-setup
