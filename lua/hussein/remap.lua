vim.keymap.set("n", "<C-n>", vim.cmd.NERDTreeToggle)
vim.keymap.set("n", "<C-f>", vim.cmd.NERDTreeFind)

-- Remap splits navigation to CTRL + hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- correct spelling on C-l
vim.keymap.set("i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { silent = true })
