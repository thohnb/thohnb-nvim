
-- -- LSP-Mason
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls","clangd","pyright"},
})
-- LSPConfig
local lspconfig = require('lspconfig')
-- CLangd
require'lspconfig'.clangd.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.emmet_ls.setup{}


require('lspsaga').setup({
    -- Diagnostic
    diagnostic = {
        diagnostic_only_current = true,
        max_height = 0.8,
        keys = {
            quit = {'q', '<ESC>'}
        }
    },
})  

vim.diagnostic.config({
    virtual_text = false
})