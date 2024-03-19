return {
    'nvimdev/dashboard-nvim',
    config = function()
        require('dashboard').setup {
            theme = 'hyper',
            config = {
                header = {
                    "Xin chào thế giới!"
                },
                shortcut = {
                    { desc = " " }
                },
                hide = {
                    statusline = true, -- hide statusline; default is true
                    tabline = true,    -- hide the tabline
                    winbar = true
                }
            }
        }
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
}
