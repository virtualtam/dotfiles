" check whether vim-plug is installed and install it if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/plugged')

" interface and themes
Plug 'arcticicestudio/nord-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" edition
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer --rust-completer' }
Plug 'mbbill/undotree'

" scm
Plug 'tpope/vim-fugitive'
Plug 'gisphm/vim-gitignore'
Plug 'mhinz/vim-signify'

" language support
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'

Plug 'elixir-editors/vim-elixir'
Plug 'vim-erlang/vim-erlang-runtime'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'

Plug 'aklt/plantuml-syntax'

Plug 'sophacles/vim-processing'

Plug 'psf/black', { 'branch': 'stable' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'vim-scripts/django.vim'
Plug 'raimon49/requirements.txt.vim'
Plug 'seeamkhan/robotframework-vim'

Plug 'rust-lang/rust.vim'

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
if (has("termguicolors"))
    set termguicolors
    let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
    let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

    colorscheme solarized8_flat
endif

" keep 10 lines of context
set scrolloff=10

set number
set cursorline

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

" grep
nnoremap <leader>/ :silent grep<Space>
autocmd QuickFixCmdPost *grep* cwindow 15

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

" paste mode
set pastetoggle=<leader>p

" quickfix
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

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

" Clojure
autocmd FileType clojure nnoremap <leader>e :silent :Eval<CR>

" CtrlP fuzzy-finder
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

" delimitMate
let g:delimitMate_expand_cr = 1

" Docker
autocmd FileType dockerfile setlocal fo-=t

" EasyAlign: Start interactively in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" EasyAlign: Start interactively for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Emmet abbreviation expansion
let g:user_emmet_leader_key='<C-E>'

" Git
autocmd BufNewFile,BufRead */gitconfig   set ft=gitconfig
autocmd BufNewFile,BufRead */.dots/git/* set ft=gitconfig

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
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>e <Plug>(go-rename)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>v <Plug>(go-vet)
autocmd Filetype go command! -bang A  call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" HAProxy
autocmd BufNewFile,BufRead */haproxy.cfg set ft=haproxy

" Javascript / JSX / Typescript
let g:jsx_ext_required = 1

" Jenkins
autocmd FileType Jenkinsfile setlocal fo-=t
autocmd BufNewFile,BufRead */jenkins/dev set ft=Jenkinsfile
autocmd BufNewFile,BufRead */jenkins/build-and-publish set ft=Jenkinsfile

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

" Shell
autocmd FileType sh setlocal fo-=t

" Signify
let g:signify_vcs_list = [ 'git', 'hg' ]

" SSH
autocmd BufNewFile,BufRead */.ssh/config.d/* set ft=sshconfig

" Tagbar
map <leader>2 :TagbarToggle<CR>

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Undotree
let g:undotree_WindowLayout=4
let g:undotree_ShortIndicators=1
map <leader>u :UndotreeToggle<CR>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
