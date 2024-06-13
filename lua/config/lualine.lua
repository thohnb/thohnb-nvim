local ll = require("lualine");
-- Set color to question
vim.g.gitblame_highlight_group = "Question"

local git_blame = require('gitblame')
ll.setup({
    extensions = {
        "nvim-tree","toggleterm"
    },
   
})