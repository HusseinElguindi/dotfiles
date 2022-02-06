set encoding=utf-8  " Set the encoding displayed
set fileencoding=utf-8  " Set the encoding written to file
set fileformat=unix " Set file formatting to Unix
set ff=unix

syntax on " Syntax highlighting
filetype plugin indent on
set scrolloff=2 " Always show at least one line above/below the cursor

set autoread " Auto reload file if modified elsewhere
set mouse=a " Enable mouse 
set number relativenumber " Set hybrid line numbers (relative + current line number)
" set autoindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent " https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
" set tabstop=4 softtabstop=4 expandtab shiftwidth=4 smarttab autoindent " https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces

setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Allow switching between buffers without saving
set hidden

set wildmenu

set ignorecase " Case insensitive searches
set smartcase " Case sensitive searches if it contains an uppercase letter

set termguicolors " Terminal GUI colors
set t_Co=256 " True colors
set cursorline " Highlight current line
set updatetime=250

set timeoutlen=1000
set ttimeoutlen=0 " https://stackoverflow.com/questions/37644682/why-is-vim-so-slow/37645334

set splitbelow splitright " Open splits below (for split) and to the right (for vsplit) by default

" Enable column on the left to show symbols (git gutter and lsp symbols)
set signcolumn=yes:1

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"
" Remove search highlighting for the last search
nnoremap <silent> <Esc><Esc> :noh<CR> 

let mapleader = "\<Space>" 

" Toggle line wrapping on leader-w
nnoremap <silent> <Leader>w :set wrap!<CR> 

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Airline & themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto complete pairs
Plug 'jiangmiao/auto-pairs'

" Theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'kristijanhusak/vim-hybrid-material'

" File tree
Plug 'preservim/nerdtree'
" Nerdtree icons
Plug 'ryanoasis/vim-devicons'

" Better commenting
Plug 'preservim/nerdcommenter' " Syntax highlighting
" Plug 'sheerun/vim-polyglot'

" Arduino syntax features
Plug 'stevearc/vim-arduino'

" Fuzzy file finding and preview
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" LSP & Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" LSP code action, definition, etc.
"Plug 'glepnir/lspsaga.nvim'

" LSP icons and formatting
Plug 'onsails/lspkind-nvim'

" Signature help
Plug 'ray-x/lsp_signature.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Vim symbols and diffs
" Plug 'airblade/vim-gitgutter'

" Recognize nested filetypes
Plug 'suy/vim-context-commentstring'

" Comment line with gcc and comment motion with gc<motion>
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-surround'

" LaTeX
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Plug 'lervag/vimtex'
    " let g:tex_flavor='latex'
    " let g:vimtex_view_method='zathura'
    " let g:vimtex_quickfix_mode=0


Plug 'nvim-treesitter/playground'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Theming
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" Fix pop up menu background and foreground colors
highlight Pmenu ctermfg=188 ctermbg=236 guifg=#dcdfe4 guibg=#1f2029

" Markdown Preview Config (:MarkdownPreview)
" Set to 1 to refresh markdown on save or leave buffer
" Set to 0 to refresh markdown on edit or move currency
let g:mkdp_refresh_slow = 0
"Set to 1 to auto close the preview window on buffer change
let g:mkdp_auto_close = 0

" Nerdcommenter config
" https://github.com/preservim/nerdcommenter#default-mappings
let g:NERDCreateDefaultMappings = 1 
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

lua <<EOF
-- Treesitter syntax highlighting
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Nerdtree mappings
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" C-p to fuzzy search files
nnoremap <C-p> :Files<CR> 
" C-i to fuzzy search in buffers
nnoremap <C-i> :Buffers<CR> 

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Use <C-w>H to switch window to horizontal
" Use <C-w>K to switch window to vertical

" Close the current buffer but keep the split with :Bd
command! Bd bp|bd #

" https://jeffkreeftmeijer.com/vim-number
" Toggle non-relative line numbering on insert mode and focus loss (and
" vice-versa)
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Ignore unnecessary file directories and types
" TODO: ignore nested node_modules
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'go/pkg/**' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
let $FZF_DEFAULT_OPTS = "--layout=reverse --info=inline --margin=1,4 --preview-window=noborder"

" Set window size and no border
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6, 'border': 'none' } }
let g:fzf_preview_window = ['right:60%', 'ctrl-/']


lua <<EOF
-- Setup nvim-cmp
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 4 },
    { name = 'cmdline' }
  },
  formatting = {
     format = lspkind.cmp_format({with_text = false, maxwidth = 25})
--    format = function(entry, vim_item)
--      local max_len = 20
--      if string.len(vim_item.abbr) > max_len then
--        vim_item.abbr = string.sub(vim_item.abbr, 1, max_len - 2) .. "··"
--      end
--      return vim_item
--    end,
  }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer', keyword_length = 2 }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline', keyword_length = 3}
  })
})


-- lspconfig setup doc
-- https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end


-- local servers = { 'ccls', 'gopls', 'pyright', 'svelte', 'cssls' }
local servers = { 'gopls', 'pyright', 'svelte', 'cssls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.ccls.setup {
  on_attach = on_attach,
  init_options = {
    compilationDatabaseDirectory = "build",
    index = {
      threads = 0;
    },
    clang = {
      excludeArgs = { "-frounding-math"},
    },
  },
}
--require'lspconfig'.ccls.setup{}

lspconfig.gopls.setup {
  on_attach = on_attach,
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
-- require'lspconfig'.gopls.setup{}

EOF
set completeopt=menu,menuone,noselect

" Register ccls C++ lanuage server.
if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
      \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif


lua require('lsp_signature').setup()

lua << EOF
-- Setup lspsaga
-- local saga = require('lspsaga')
-- saga.init_lsp_saga()
EOF

" Show hover doc
" nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" nnoremap <silent> gr <cmd>lua require('lspsaga.rename').rename()<CR>
" Preview definition
" nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

"autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Go format on save
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()

" autocmd BufRead,BufNewFile *.tex set shiftwidth=4 softtabstop=0 

" let g:arduino_home_dir = "$HOME/.arduino15"

let g:livepreview_previewer = 'evince'
let g:livepreview_cursorhold_recompile = 0

let g:UltiSnipsSnippetDirectories=['./snips']

let g:tex_flavor = 'latex'
" let g:tex_indent_items=0
" let g:tex_indent_and=0
" let g:tex_indent_brace=0

" command! IsTexMathEnv lua print(require('tex-env').isMathEnv())
function IsTexMathEnv()
    let g:isTexMathEnv = 0
lua << EOF
    vim.g['isTexMathEnv'] = require('tex-env').isMathEnv()
EOF
return g:isTexMathEnv
endfunction
