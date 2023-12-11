" Author: sayemon10
" url: https://sayemon10.com

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
filetype plugin indent on
colorscheme gruvbox

let g:airline_powerline_fonts = 1
let g:airline_section_b = 'BN: %{bufnr("%")}'
let g:airline_section_y = '%{strftime("%c")}'
let g:airline_theme='simple'
let g:files_respect_gitignore = 1
let g:user_emmet_leader_key='<C-Z>'
let mapleader = "-"
map <Esc><Esc> :w<CR>
nnoremap <down> <nop>
nnoremap <leader>f :e .
nnoremap <leader>s :split
nnoremap <leader>v :vsplit
nnoremap <leader>w :%s/\s\+$//e
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap O O<esc>
nnoremap o o<esc>

set autoindent
set background=dark
set backspace=2
set colorcolumn=80
set complete+=kspell
set encoding=UTF-8
set et
set expandtab
set foldenable
set guicursor=n-v-c-i:block
set guioptions-=T
set guioptions-=m
set guioptions-=r
set hidden
set history=1000
set incsearch
set is
set laststatus=2
set listchars=trail:-
set mouse=a
set nobackup
set nocompatible
set noswapfile
set nowritebackup
set path+=**
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
set wildignore=*.exe,*.dll,*.pdb
set wildmenu
syntax on enable

call plug#begin('~/vim/plugged')

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'Donaldttt/fuzzyy'
Plug 'morhetz/gruvbox'

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
