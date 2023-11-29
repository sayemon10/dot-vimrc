" Author: sayemon10
" url: https://sayemon10.com
filetype indent on
map <Esc><Esc> :w<CR>
let mapleader = "-"
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap o o<esc>
nnoremap O O<esc>
nnoremap <leader>v :vsplit
nnoremap <leader>s :split
nnoremap <leader>w :%s/\s\+$//e
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
colorscheme gruvbox
set autoindent
set background=dark
set colorcolumn=80
set complete+=kspell
set encoding=UTF-8
set et
set expandtab
set foldenable
set guicursor=n-v-c-i:block
set guioptions-=m
set guioptions-=T
set guioptions-=r
set hidden
set history=5112
set incsearch
set is
set laststatus=2
set listchars=trail:-
set mouse=a
set nobackup
set nocompatible
set noswapfile
set nowritebackup
set rnu
set ruler
set shiftwidth=4
set shortmess+=I
set showcmd
set showmode
set signcolumn
set smartindent
set smarttab
set softtabstop=4
set statusline=
set t_Co=256
set tabstop=4
set title
set ttyfast
set virtualedit=all
set wildmenu
set wildignore=*.exe,*.dll,*.pdb
syntax on enable

call plug#begin('~/vim/plugged')

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gi <plug>(lsp-definition)
    nmap <buffer> gd <plug>(lsp-declaration)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gl <plug>(lsp-document-diagnostics)
    nmap <buffer> <f2> <plug>(lsp-rename)
    nmap <buffer> <f3> <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
packadd! matchit
