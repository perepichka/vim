" ===================================
" CHANGE THIS TO YOUR PYTHON PROVIDER !!!
" ===================================
if has('win32') || has('win64')
    let g:python3_host_prog='G:/conda/envs/research/python.exe'
else
    let g:python3_host_prog='/home/mperepichka/miniconda3/envs/py38/bin/python'
endif


"Windows subsystem annoying beep fix
set visualbell

set autoindent

" show existing tab with 4 spaces width
set tabstop=8
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" Turn on line numbering. Turn it off with “set nonu”

set number
set relativenumber

" Case insensitive search

set ic

" Highlight search

set hls

" Wrap text instead of being on one line

set lbr


"set t_8f=^[[38;2;%lu;%lu;%lum
"set t_8b=^[[48;2;%lu;%lu;%lum

" Backspace stuff

set backspace=indent,eol,start

" Language settings

setlocal spell spelllang=en_us

" Bracket matching selection

"noremap % v%

" Automates the above

":set showmatch
"
":set matchtime=3
"
"inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
"
"inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
"
"inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

" Rebinds for escape key

ino jj <esc>

cno jj <c-c>

vno v <esc>



" Folding stuff
set foldenable
set foldlevelstart=10 "Opens most folds by def
set foldnestmax=10 " sets max for fold
set foldmethod=indent " sets max for fold

"move vertically by visual line
"nnoremap j gj
"nnoremap k gk

" Sudo permissions (unix-based os)
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Adds column at line 80
set colorcolumn=80
" mouse support
set mouse=a

" Helps you actually get out of the terminal in nvim terminal emulator
tnoremap <Esc> <C-\><C-n>

" ======================= Python Dev Stuff ======================= "

" Python PEP8
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

" Flag extra white spaces as red
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Work with utf-8
set encoding=UTF-8

" ------------------------- Plugin stuff ------------------------- "

filetype off

" --- VIM PLUG STUFF --- "
call plug#begin('~/.vim/plugged')


" Debug startup times
Plug 'dstein64/vim-startuptime'

" Fuzzy finder (maybe switch?)
"Plug 'kien/ctrlp.vim'

" Color scheme
"Plug 'overcache/NeoSolarized'
"Plug 'rebelot/kanagawa.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Patch font icons
" Plug 'mortepau/codicons.nvim' Not sure what this actually does

" Tim Pope's plugins
Plug 'tpope/vim-fugitive' " Git integration
Plug 'tpope/vim-unimpaired' " Unimpaired vim keybinds
Plug 'tpope/vim-speeddating' " Increment dates
Plug 'tpope/vim-surround' " Increment dates
Plug 'tpope/vim-repeat' " Repeat plugin commands with .

"Plug 'vim-scripts/indentpython.vim' " Auto-indent pep8 style
"
Plug 'kshenoy/vim-signature' " Visual marks
"
"Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
"
""Plug 'scrooloose/nerdtree' " File browser on the left, disabled for now
"
"" Status bar
Plug 'vim-airline/vim-airline' " Status bar on the bottom
Plug 'vim-airline/vim-airline-themes' " Airline themes

"Plug 'gcmt/taboo.vim' " Taboo
"
"
"" Deoplete
""if has('nvim')
""  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
""else
""  Plug 'Shougo/deoplete.nvim'
""  Plug 'roxma/nvim-yarp'
""  Plug 'roxma/vim-hug-neovim-rpc'
""endif
"
"" Jedi python autocompletion
""Plug 'zchee/deoplete-jedi'
"
"" Jedi goto functionality
"Plug 'davidhalter/jedi-vim'
"
"

" LSP
Plug 'neovim/nvim-lspconfig'

" Renaming
Plug 'smjonas/inc-rename.nvim'


"
""Plug 'donRaphaco/neotex' " neo tex latex auto preview
"
"" Fuzzy file search fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ibhagwan/fzf-lua'


"
"" Neovim debugging
""Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
"
"" Code syntax check + build automation
""Plug 'neomake/neomake'
"
"" Python formatting
Plug 'sbdchd/neoformat'
"
"" Simplify Folding
Plug 'tmhedberg/SimpylFold'

"" Better syntax highlighting
Plug 'sheerun/vim-polyglot'

" Github Copilot
Plug 'github/copilot.vim'

" Black formatter
"Plug 'averms/black-nvim', { 'do': ':UpdateRemotePlugins' }

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
if has('win32') || has('win64')
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
else
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
endif
Plug 'nvim-telescope/telescope-file-browser.nvim'

"  Nvim DAB (Python Debugger) Stuff
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate:'}
Plug 'mfussenegger/nvim-dap'

Plug 'mfussenegger/nvim-dap-python'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-neotest/nvim-nio'
Plug 'theHamsta/nvim-dap-virtual-text'

" Autosession
Plug 'rmagatti/auto-session'



"" Initialize plugin system
call plug#end()

"" Set syntax on
syntax on
filetype plugin indent on
"
" ===============  Color Scheme Stuff =============== "

" Change colorscheme from default to solarized
" set termguicolors
" set t_Co=256

"colorscheme NeoSolarized
" let g:neosolarized_contrast = "normal"
" let g:neosolarized_visibility = "normal"
" let g:neosolarized_vertplitBgTrans = 0

"colorscheme kanagawa-dragon
colorscheme catppuccin


" Bunch of color hacks to make this work in WSL
" hi Normal guibg=bg
" hi Normal guifg=fg
" hi NonText guibg=bg
" hi NonText guifg=fg
" hi SpellBad guibg=bg
" hi SpellBad guifg=fg
" hi SpellLocal guibg=bg
" hi SpellLocal guifg=fg
" hi SpellCap guibg=bg
" hi SpellCap guifg=fg
" hi SpellRare guibg=bg
" hi SpellRare guifg=fg
" hi EndOfBuffer guibg=bg
" hi EndOfBuffer guifg=fg
" hi Underline guibg=bg
" hi Underline guifg=fg

set background=dark


" ===============  Airline Stuff =============== "

" enable/disable bufferline integration >
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#fnamemod = ':t'

"let g:airline_theme='solarized'

" Replace tabs with buffers. Solution by Josh Davis
set hidden
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"
" ===============  Jedi Stuff =============== "
"" disable autocompletion, because we use deoplete for completion
"let g:jedi#completions_enabled = 0
"
"" open the go-to function in split, not another buffer
"let g:jedi#use_splits_not_buffers = "right"
"
"" ===============  Deoplete Stuff =============== "
"let g:deoplete#enable_at_startup=1
"
"" Disable buffer and around source for deoplete
"call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']})
"
"" Autoclose Preview window that gives hints on usage of functions
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
"

" Navigate thru auto-complete list with Tab key
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"
"
"" ===============  Neomake/Pylint Stuff =============== "
""let g:neomake_python_pylint_maker = {
""  \ 'args': [
""  \ '-d', 'C0103, C0111',
""  \ '-f', 'text',
""  \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
""  \ '-r', 'n'
""  \ ],
""  \ 'errorformat':
""  \ '%A%f:%l:%c:%t: %m,' .
""  \ '%A%f:%l: %m,' .
""  \ '%A%f:(%l): %m,' .
""  \ '%-Z%p^%.%#,' .
""  \ '%-G%.%#',
""  \ }
""
""let g:neomake_python_enabled_makers = ['flake8', 'pylint']
""call neomake#configure#automake('nrwi', 500)
"

" ===============  Neoformat Stuff =============== "
" Set which linters to use
let g:neoformat_enabled_python = ['ruff', 'isort']

let g:neoformat_python_ruff = {
            \ 'exe': 'G:/conda/envs/research/Scripts/ruff.exe',
            \ 'stdin': 1,
            \ 'args': ['format', '-q', '-'],
            \ }
let g:neoformat_python_isort = {
            \ 'exe': 'G:/conda/envs/research/Scripts/isort.exe',
            \ 'stdin': 1,
            \ 'args': ['--profile', 'black', '-'],
            \ }

" Run all linters
let g:neoformat_run_all_formatters = 1

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Enable autoformat on save
augroup fmt
    autocmd!
    autocmd BufWritePre * :Neoformat
augroup END

" ===============  Telescope stuff =============== "
" Find files using Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fb <cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>

" ===============  DAP Debugger Stuff =============== "
" Closing of DAP windows
autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>

if has('win32') || has('win64')
    " Find better windows soln
else
    lua require('init')
    end
