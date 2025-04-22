" Author: sayemon10
" url: https://www.sayemon10.com

call plug#begin('~/vim/plugged')
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'Donaldttt/fuzzyy'
Plug 'sheerun/vim-polyglot'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'morhetz/gruvbox'
call plug#end() 

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
filetype plugin indent on
colorscheme gruvbox

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
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
map <F5> :bp<CR>
imap <F5> <Esc>:bp<CR>
tmap <F5> <C-W>:bp<CR>
map <F6> :bn<CR>
imap <F6> <Esc>:bn<CR>
tmap <F6> <C-W>:bn<CR>
map <F7> :bd<CR>
imap <F7> <Esc>:bd<CR>
map <F8> :ls<CR>
imap <F8> <Esc>:ls<CR>
tmap <F8> <C-W>:ls<CR>
" Copy current file path
map <F9> :let @+ = fnamemodify(@%, ":p")<CR>
imap <F9> <Esc>:let @+ = fnamemodify(@%, ":p")<CR>
" Go to previous/next quickfix result (for example, useful for going through
" :grep or
" :vimgrep results)
map <F10> :cp<CR>
imap <F10> <Esc>:cp<CR>
map <F11> :cn<CR>
imap <F11> <Esc>:cn<CR>
map <F1> :Copilot panel<CR>

" Github Copilot
function! ToggleCopilot()
    if copilot#Enabled()
        Copilot disable
    else
        Copilot enable
    endif
    " echo "Copilot is " .(g:CopilotEnabled ? "enabled" : "disabled")
    Copilot status
endfunction

inoremap <F12> <ESC>:call ToggleCopilot()<CR>a
nnoremap <F12> :call ToggleCopilot()<CR>
imap <C-M-[> <Plug>(copilot-previous)
imap <C-M-]> <Plug>(copilot-next)

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
set shell=C:\\Program\ Files\\Git\\bin\\bash.exe
set shellcmdflag=--login\ -i
set shellquote=
set shellxquote=
set shiftwidth=4
set shortmess+=I
set showcmd
set showmode
set signcolumn
set smartindent
set smarttab
set smoothscroll sms
set softtabstop=4
set statusline=
set t_Co=256
set tabstop=4
set title
set ttyfast
set virtualedit=all
set wildignore+=*.exe,*.dll,*.pdb,*/node_modules/*,.next/*,.git/*
set wildmenu
syntax on enable

let g:airline_powerline_fonts = 1
let g:airline_section_b = 'BN: %{bufnr("%")}'
let g:airline_section_y = '%{strftime("%c")}'
let g:airline_theme='simple'
let g:files_respect_gitignore = 1
let g:user_emmet_leader_key='<C-Z>'
let mapleader = "-"
let g:fuzzyy_exclude_file = ['node_modules/**', '.git/**', '.next/**', 'dist/**', 'build/**']
let g:fuzzyy_files_exclude_file = ['node_modules/**', '.git/**', '.next/**', 'dist/**', 'build/**']
let g:fuzzyy_grep_exclude_file = ['node_modules/**', '.git/**', '.next/**']
let g:fuzzyy_mru_exclude_file = ['node_modules/**', '.git/**', '.next/**']
let g:fuzzyy_files_cmd = 'rg --files --hidden --glob "!node_modules/*" --glob "!.git/*" --glob "!.next/*" --glob "!dist/*" --glob "!build/*"'
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
