-- Treesitter
local ts = require("nvim-treesitter.configs")

ts.setup(
    {
        ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "javascript", "html"},
        sync_install = false,
        highlight = { enable = true},
        indent = { enable = true}
    }
)
