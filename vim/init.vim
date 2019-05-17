" check whether vim-plug is installed and install it if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/plugged')

" interface and themes
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" edition
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" scm
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" compiler
Plug 'hoaproject/Contributions-Vim-Pp'

" dev
Plug 'vim-scripts/django.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'seeamkhan/robotframework-vim'

" system
Plug 'pearofducks/ansible-vim'  " ansible yaml and hosts
Plug 'vim-scripts/ferm.vim'     " ferm firewall
Plug 'infobip/haproxy.vim'      " HAProxy
Plug 'robbles/logstash.vim'     " logstash pipelines
Plug 'tmatilai/vim-monit'       " monit
Plug 'crazy-canux/nagios.vim'   " nagios, icinga, shinken
Plug 'chr4/nginx.vim'           " nginx
Plug 'hashivim/vim-packer'      " packer
Plug 'hashivim/vim-terraform'   " terraform
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
filetype plugin indent on
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4

" display
syntax on
set background=dark

let g:airline_theme='base16'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

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

" leader key
:let mapleader = ","

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tab navigation
nnoremap <C-right> :tabnext<CR>
nnoremap <C-left>  :tabprevious<CR>
inoremap <C-right> <Esc>:tabnext<CR>
inoremap <C-left>  <Esc>:tabprevious<CR>

" Ansible: Reset indentation after 2 newlines in insert-mode
let g:ansible_unindent_after_newline = 1

" CtrlP fuzzy-finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" EasyAlign: Start interactively in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" EasyAlign: Start interactively for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Emmet abbreviation expansion
let g:user_emmet_leader_key='<C-E>'

" Go
" See the tutorial at https://github.com/fatih/vim-go-tutorial
let g:go_version_warning = 0
" let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"

let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1

au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" nagios, icinga, shinken
au BufRead,BufNewFile */\(monitoring\|shinken\)/*/*.cfg set filetype=nagios

" NerdTree
map <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$']

" Signify
let g:signify_vcs_list = [ 'git', 'hg' ]

" Tagbar
map <F2> :TagbarToggle<CR>

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
