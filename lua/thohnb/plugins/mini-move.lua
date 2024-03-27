return { 'echasnovski/mini.move', version = '*' ,
    config = function()
        require('mini.move').setup({
            mappings = {
                -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
               
                down = '<M-Down>',
                up = '<M-Up>',
                left = '<M-Left>',
                right = '<M-Right>',
            
                -- Move current line in Normal mode
               
                line_down = '<M-Down>',
                line_up = '<M-Up>',
                line_left = '<M-Left>',
                line_right = '<M-Right>',
              },
        })
    end
}