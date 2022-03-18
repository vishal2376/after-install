"Fix vim 4m2m weird text    
let &t_TI = ""
let &t_TE = ""

"-----------------------------Basic settings-----------------------------
set number
set nocompatible
set cursorline
set ic
set showcmd
set nohls
set incsearch
set smartcase
set hidden

set expandtab
"set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

filetype on
filetype plugin on
filetype indent on
set encoding=UTF-8

set history=1000

syntax enable
set background=dark
set termguicolors
colorscheme one
set guifont=JetBrainsMono\ 13

"Plugins 
call plug#begin('~/.vim/plugged')

Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
"Plug 'dylanaraps/fff'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

"---------------------------Key Mappings----------------------------------

"Save file
noremap <silent> <C-S> :update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

"Copy Paste
noremap <silent> <C-c> "+y
noremap <silent> <C-S-v> "+gP

nnoremap <TAB> %

"File compile
autocmd filetype cpp nnoremap <C-b> <ESC> :w <CR> :!g++ -o %< % && ./%< <CR>
autocmd filetype cpp inoremap <C-b> <ESC> :w <CR> :!g++ -o %< % && ./%< <CR>

autocmd filetype python nnoremap <C-b> <ESC> :w <CR> :!python3 % <CR>
autocmd filetype python inoremap <C-b> <ESC> :w <CR> :!python3 % <CR>

autocmd filetype sh nnoremap <C-b> <ESC> :w <CR> :!./% <CR>
autocmd filetype sh inoremap <C-b> <ESC> :w <CR> :!./% <CR>

"Close current file
nnoremap <C-w> :bd <CR>

"New File
nnoremap <C-S-n> :enew <CR>

"Switch between files
nnoremap <C-TAB> :bn <CR>
inoremap <C-TAB> <ESC> :bn <CR>

"Select all text
nnoremap <C-a> ggVG <CR>

"Move line
nnoremap <C-S-DOWN> ddp
inoremap <C-S-DOWN> <ESC> ddp  

nnoremap <C-S-UP> dd2kp  
inoremap <C-S-UP> <ESC> dd2kp  

"Split screen
nnoremap <C-v> :vsplit <CR>
nnoremap <C-h> :split <CR>


"Disable Caps Lock and use it as Escape
"au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

"--------------------Leader Key-------------------
let mapleader=" "

"Move between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"Comment the code
autocmd filetype cpp nnoremap <silent><leader>/ :s/^/\/\// <CR>  
autocmd filetype python nnoremap <silent><leader>/ :s/^/#/ <CR>  

"close window
nnoremap <leader>q :close<CR>

"-----------------------Plugin Settings---------------------------

"fzf
nnoremap<silent><C-f> :F <CR>

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Coc.nvim
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent> gd :call CocAction('jumpDefinition','vsplit')<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
