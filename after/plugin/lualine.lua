local theme = require('lualine.themes.auto')
--local theme = require'lualine.themes.ayu_mirage'
--local theme = require'lualine.themes.palenight'


theme.normal.c.fg = "#76849c"
theme.insert.c.fg = "#76849c"
theme.visual.c.fg = "#76849c"
theme.replace.c.fg = "#76849c"
theme.command.c.fg = "#76849c"
theme.inactive.c.fg = "#76849c"

-- theme.inactive.b.bg = theme.inactive.c.bg

require('lualine').setup {
    options = {
        component_separators = { left = '|', right = '|'},
        -- section_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        theme = theme
    }
}
