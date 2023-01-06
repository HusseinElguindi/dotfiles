local present, telescope = pcall(require, 'telescope')
if not present then
  return
end


local builtin = require('telescope.builtin')

-- Most Recently Used buffer sorting
local function buf_mru()
    builtin.buffers({ sort_mru = true })
end

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-b>', buf_mru, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local actions = require('telescope.actions')

local options = {
    defaults = {
        selection_caret = '> ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                results_width = 0.8,
            },
            preview_cutoff = 120,
        },
        file_ignore_patterns = { 'node_modules' },
        path_display = { 'truncate' },
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        mappings = {
            n = {
                ['<C-c>'] = actions.close,
                ['q'] = actions.close
            },
            i = {
                ['<C-c>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous
            },
        },
    }
}

telescope.setup(options)
