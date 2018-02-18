set nocompatible
set hidden
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" colors
Plugin 'chriskempson/base16-vim'
Plugin 'jellybeans.vim'
" Plugin 'mswift42/vim-themes'

Plugin 'tpope/vim-surround'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'

Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'

" autocomplete
"Plugin 'shougo/deoplete.nvim'
"Plugin 'Valloric/YouCompleteMe'

Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/nerdcommenter'

Plugin 'ekalinin/Dockerfile.vim'  "

"Plugin 'easymotion/vim-easymotion'
Plugin 'majutsushi/tagbar'
"Plugin 'fatih/vim-go' "
"Plugin 'klen/python-mode'
"Plugin 'L9' " plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'file:///home/gmarik/path/to/plugin' " git repos on your local machine (i.e. when working on your own plugin)

" snippets
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
