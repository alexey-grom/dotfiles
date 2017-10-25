set nocompatible
set hidden
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'

Plugin 'tpope/vim-surround'
Plugin 'guns/vim-sexp'

Plugin 'vim-airline/vim-airline' " +
Plugin 'vim-airline/vim-airline-themes' " +

Plugin 'vim-ctrlspace/vim-ctrlspace' " +

Plugin 'scrooloose/nerdtree' " +
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'tpope/vim-fugitive' " интеграция с гитом
" Plugin 'airblade/vim-gitgutter' " изменения слева

" autocomplete
"Plugin 'shougo/deoplete.nvim'
"Plugin 'Valloric/YouCompleteMe'

Plugin 'rstacruz/sparkup' " zen coding
Plugin 'scrooloose/nerdcommenter' " commenting

Plugin 'ekalinin/Dockerfile.vim'  "

" colors
Plugin 'chriskempson/base16-vim'
Plugin 'jellybeans.vim'
" Plugin 'mswift42/vim-themes'

"Plugin 'easymotion/vim-easymotion' " быстрое перемещение
Plugin 'majutsushi/tagbar' " the tags of the current file
"Plugin 'fatih/vim-go' "
"Plugin 'klen/python-mode'
"Plugin 'L9' " plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'file:///home/gmarik/path/to/plugin' " git repos on your local machine (i.e. when working on your own plugin)

" snippets
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
