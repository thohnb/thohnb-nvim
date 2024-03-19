
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_disable_default_keybindings = 1
vim.wo.number = true
vim.opt.termguicolors = true
vim.api.nvim_buf_set_option(0, 'modifiable', true)
vim.o.shell = "bash.exe"
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


