return
    {'romgrk/barbar.nvim',
      dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
      },
      config =  function()
        vim.g.barbar_auto_setup = false 
        require ("barbar").setup{
            animation = false,
            tabpages = false,
            highlight_visible = false,
            exclude_ft = {'"NvimTree",'},
            exclude_name = {"NvimTree"},
            -- Sidebar
            
            separator = {left = '', right = ''},
            minimum_padding = 0,
            preset = 'powerline',
            separator_at_end = false,
            pinned = {button = '', filename = true},
            sidebar_filetypes = {
                ['neo-tree'] = {event = 'BufWipeout',text = "Sidebar",algin ="left"},
              },
              no_name_title = "New buffer",
        }
     
    end
    }
