return {
    'CRAG666/betterTerm.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
        local betterTerm = require("betterTerm")
        betterTerm.setup({
            vim.keymap.set({"n", "t"}, "<C-t>", betterTerm.open, { desc = "Open terminal"}),
            position = "right",
            size = 25
        })
    end
}
