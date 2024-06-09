local ll = require("lualine");
vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
-- Set color to question
vim.g.gitblame_highlight_group = "Question"

local git_blame = require('gitblame')
ll.setup({
    extensions = {
        "nvim-tree","toggleterm"
    },
    sections = {
        lualine_c = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
        }
}
    --// Gitblame
})