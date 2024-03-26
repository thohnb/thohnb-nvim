return {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      {'MunifTanjim/nui.nvim'}
    },
    config = function()
      local fineline = require('fine-cmdline')
      local fn = fineline.fn
      fineline.setup({      
        hooks = {
          after_mount = function(input)
            vim.api.nvim_buf_del_keymap(input.bufnr, 'i', '<Up>')
            vim.api.nvim_buf_del_keymap(input.bufnr, 'i', '<Down>')
          end,
          set_keymaps = function(imap, feedkeys)
            -- Restore default keybindings...
            -- Except for `<Tab>`, that's what everyone uses to autocomplete
            imap('<Esc>', fn.close)
            imap('<C-c>', fn.close)
      
            imap('<Up>', fn.up_history)
            imap('<Down>', fn.down_history)
          end
        }
      })
  end
  }