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

" language support
Plug 'aklt/plantuml-syntax'

call plug#end()

syntax on
set number
