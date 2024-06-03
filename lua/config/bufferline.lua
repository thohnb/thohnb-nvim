-- require("")
local bl = require("bufferline")

-- Setup
bl.setup({
    -- Setup it
    options = {
        always_show_bufferline = true,
        
        custom_filter = function(buf_number, buf_numbers)
            -- filter out filetypes you don't want to see
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= " " then
                return true
            end
            -- filter out by it's index number in list (don't show first buffer)
            if buf_numbers[1] ~= buf_number then
                return true
            end
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer" ,
                text_align = "center",
                separator = true
            }
        },
    }
    
})