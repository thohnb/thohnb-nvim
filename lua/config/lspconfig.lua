
-- -- LSP-Mason
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls","clangd","pyright"},
})
-- LSPConfig
local lspconfig = require('lspconfig')
-- Langd
require'lspconfig'.clangd.setup{}