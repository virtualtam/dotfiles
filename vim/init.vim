" check whether vim-plug is installed and install it if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/plugged')

" edition
Plug 'editorconfig/editorconfig-vim' " .editorconfig support

" scm
Plug 'airblade/vim-gitgutter'

" devops
Plug 'pearofducks/ansible-vim'
Plug 'robbles/logstash.vim'
Plug 'hashivim/vim-vagrant'

" modeling
Plug 'aklt/plantuml-syntax'

" web
Plug 'mattn/emmet-vim'

call plug#end()

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

set number
:hi LineNr       cterm=NONE ctermbg=black ctermfg=NONE

set cursorline
:hi CursorLine   cterm=NONE ctermbg=black ctermfg=NONE
:hi CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE

set wildmenu
set wildignore+=tags,.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.svg,*.zip

" buffers & windows
set browsedir=buffer
set splitbelow
set splitright
