-- Setup
local term = require("toggleterm")
local shell = nil
term.setup({
    -- Open Terminal
    open_mapping = [[<c-t>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    autochdir = true, -- Auto change
    shade_terminals = false,

    on_open = function(term)
        -- Prevent infinite calls from freezing neovim.
        -- Only set these options specific to this terminal buffer.
        vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
        vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })

        -- Prevent horizontal terminal from obscuring `nvim-tree`.
        local api = require("nvim-tree.api")
        local tree = require("nvim-tree.view")
        if tree.is_visible() and term.direction == "horizontal" then
            local width = vim.fn.winwidth(tree.get_winnr())
            api.tree.toggle()
            tree.View.width = width
            api.tree.toggle(false, true)
        end
    end,
})