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
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

" scm
Plug 'tpope/vim-fugitive'
Plug 'gisphm/vim-gitignore'
Plug 'mhinz/vim-signify'

" dev
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'cespare/vim-toml'

" system
Plug 'pearofducks/ansible-vim'  " ansible yaml and hosts
Plug 'vim-scripts/ferm.vim'     " ferm firewall
Plug 'itkq/fluentd-vim'         " fluentd, td-agent
Plug 'infobip/haproxy.vim'      " HAProxy
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'google/vim-jsonnet'       " jsonnet, grafonnet, ksonnet
Plug 'moon-musick/vim-logrotate'
Plug 'robbles/logstash.vim'     " logstash pipelines
Plug 'tmatilai/vim-monit'       " monit
Plug 'crazy-canux/nagios.vim'   " nagios, icinga, shinken
Plug 'chr4/nginx.vim'           " nginx
Plug 'hashivim/vim-packer'      " packer
Plug 'hashivim/vim-terraform'   " terraform
Plug 'hashivim/vim-vagrant'     " vagrant, ruby
Plug 'fgsch/vim-varnish'        " varnish, vcl

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

set history=1000

set wildmenu
set wildignore+=tags,.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.svg,*.zip

" buffers & windows
set browsedir=buffer
set splitbelow
set splitright

" leader key
:let mapleader = ","

set pastetoggle=<leader>p

" tab navigation
nnoremap <C-H> :tabprevious<CR>
nnoremap <C-L> :tabnext<CR>
inoremap <C-H> <Esc>:tabprevious<CR>
inoremap <C-L> <Esc>:tabnext<CR>

" tab navigation (arrows)
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

" nagios, icinga, shinken
au BufRead,BufNewFile */\(monitoring\|shinken\)/*/*.cfg set filetype=nagios

" NerdTree
map <leader>1 :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$']

" Python
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 120
let g:pymode_lint_options_pep8 = {'max_line_length': g:pymode_options_max_line_length}

" Signify
let g:signify_vcs_list = [ 'git', 'hg' ]

" Tagbar
map <leader>2 :TagbarToggle<CR>

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1
