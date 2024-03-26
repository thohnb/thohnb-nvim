return { 'echasnovski/mini.starter', version = '*',
config = function()
    local header = 
[[
    "Hello World"
]]
local starter = require('mini.starter')
    starter.setup({
        silent = true,
        query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',
        items = {
            -- Show list 5 files gần nhất
            starter.sections.recent_files(10, true),
        starter.sections.builtin_actions(),
        },
        content_hooks = {
          function(content)
            local blank_content_line = { { type = 'empty', string = '' } }
            local section_coords = starter.content_coords(content, 'section')
            -- Insert backwards to not affect coordinates
            for i = #section_coords, 1, -1 do
              table.insert(content, section_coords[i].line + 1, blank_content_line)
            end
            return content
          end,
          starter.gen_hook.adding_bullet("» "),
          starter.gen_hook.aligning('center', 'center'),
        },
        header = header,
        footer = '',
      })
end
}
