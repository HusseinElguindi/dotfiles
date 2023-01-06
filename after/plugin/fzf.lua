-- vim.keymap.set('n', '<C-p>', ":Files", { silent = true })
-- vim.keymap.set('n', '<C-b>', ":Buffers<CR>", { silent = true })

-- Set window and preview size
vim.g.fzf_layout = { ['window'] = { ['width'] = 0.8, ['height'] = 0.9 } }
vim.g.fzf_preview_window = { 'right:55%', 'ctrl-/' }
