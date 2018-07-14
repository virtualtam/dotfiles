" check whether vim-plug is installed and install it if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/plugged')

" solarized color scheme
Plug 'lifepillar/vim-solarized8'

" edition
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'

" scm
Plug 'airblade/vim-gitgutter'

" compiler
Plug 'hoaproject/Contributions-Vim-Pp'

" dev
Plug 'vim-scripts/django.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" devops
Plug 'pearofducks/ansible-vim'  " ansible yaml and hosts
Plug 'robbles/logstash.vim'     " logstash pipelines
Plug 'crazy-canux/nagios.vim'   " nagios, icinga, shinken
Plug 'hashivim/vim-vagrant'     " vagrant, ruby

" modeling
Plug 'aklt/plantuml-syntax'

" web
Plug 'mattn/emmet-vim'

call plug#end()

" explicitly disable backwards vi compatibility
set nocompatible

" editor behavior
set textwidth=80

set encoding=utf-8
set fileencodings=utf-8
set ffs=unix,dos

" indentation
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4

" display
syntax on
set background=dark

" enable true color support
if &term =~? 'xterm-\(256color\|termite\)'
    set termguicolors
    colorscheme solarized8_flat
endif

" keep 10 lines of context
set scrolloff=10

set number
:hi LineNr       cterm=NONE ctermbg=black ctermfg=NONE guibg=#073642 guifg=NONE

set cursorline
:hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=#073642 guifg=NONE
:hi CursorLineNr cterm=NONE ctermbg=NONE  ctermfg=NONE guibg=#002b36 guifg=NONE

set wildmenu
set wildignore+=tags,.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.svg,*.zip

" buffers & windows
set browsedir=buffer
set splitbelow
set splitright

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" CtrlP fuzzy-finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" Emmet abbreviation expansion
let g:user_emmet_leader_key='<C-E>'

" nagios, icinga, shinken
au BufRead,BufNewFile */\(monitoring\|shinken\)/*/*.cfg set filetype=nagios
