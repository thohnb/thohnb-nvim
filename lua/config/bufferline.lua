-- require("")
local bl = require("bufferline")
-- Setup
bl.setup({
    -- Setup it
    options = {
        always_show_bufferline = true,
        show_close_icon = false,
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
        offsets = {
            -- NvimTree Offsets
            {
                filetype = "NvimTree",
                text = "File Explorer" ,
                text_align = "center",
                separator = true
            },
            -- ToggleTerm Offsets
            
        },
    }
    
})