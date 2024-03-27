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
            exclude_name = {'/bin/bash'},
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
        vim.cmd('hi BufferCurrent ctermbg=black')
        vim.cmd('hi BufferInactive ctermbg=black')
        vim.cmd('hi BufferAlternate ctermbg=black')
        vim.cmd('hi BufferVisible ctermbg=black')
        vim.cmd('hi BufferCurrentMod ctermbg=black')
        vim.cmd('hi BufferCurrentSign ctermbg=black')
        vim.cmd('hi BufferCurrentIcon ctermbg=black')
        vim.cmd('hi BufferTabPages ctermbg=black')
        vim.cmd('hi BufferTabPages ctermbg=black')
        vim.cmd('hi BufferTabpageFill ctermbg=black')
        vim.cmd('hi BufferTabpagesSep ctermbg=black')


    end
    }