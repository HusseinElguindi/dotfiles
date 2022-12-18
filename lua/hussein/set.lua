vim.opt.encoding = "utf-8" -- Set the encoding displayed
vim.opt.fileencoding = "utf-8"  -- Set the encoding written to file
vim.opt.fileformat = "unix" -- Set file formatting to Unix

vim.opt.hidden = true -- Switch between buffers without savingoset wildmenu
--vim.opt.wildmenu

vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true

-- https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true

vim.opt.ignorecase = true -- Case insensitive searches
vim.opt.smartcase = true -- Case sensitive searches if it contains an uppercase letter

vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0 -- https://stackoverflow.com/questions/37644682/why-is-vim-so-slow/37645334

-- Open splits below (for split) and to the right (for vsplit) by default
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.spelllang = "en_us"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.cmd("set t_Co=256")

vim.opt.termguicolors = true -- Terminal GUI colors
vim.opt.cursorline = true -- Highlight current line
vim.opt.updatetime = 250

vim.opt.signcolumn = "yes:1"

vim.g.mapleader = " "

-- https://jeffkreeftmeijer.com/vim-number
-- Toggle non-relative line numbering on insert mode and focus loss (and vice-versa)
vim.cmd([[
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END]])

vim.opt.completeopt = "menu,menuone,noselect"

vim.cmd([[
    filetype plugin indent on]])
vim.opt.backspace = "indent,eol,start"
