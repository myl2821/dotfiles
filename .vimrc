set encoding=utf-8

let mapleader = " "

syntax on
colo darkblue
set smartindent
set nocompatible
set autochdir
set smarttab
"set noexpandtab                         " use tabs, not spaces
set expandtab
set tabstop=8                           " tabstops of 8
set shiftwidth=4                        " indents of 4
set backspace=indent,eol,start
 
set mouse=a
set splitright

autocmd Filetype scala,ruby,javascript,yaml,vue setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype go,haskell,rust setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype go setlocal noexpandtab

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go'
Plugin 'dylon/vim-antlr'
Plugin 'cespare/vim-toml'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ycm
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_error_symbol = '>>'

let g:go_fmt_command = "goimports"

" nerdtree
let g:NERDTreeWinPos = "left"
autocmd vimenter * NERDTree
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-m> :NERDTreeFind<CR>
nmap <leader>gd <C-w>]
nnoremap <C-\> <C-w>T
nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>
noremap <leader>n :set number!<CR>
let g:NERDTreeMouseMode=3
let g:rustfmt_autosave = 1

let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

set clipboard=unnamed

au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

set tags=tags

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END
