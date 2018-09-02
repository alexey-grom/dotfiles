set nocompatible
set hidden
filetype off

set rtp+=~/.config/nvim/custom

" set the runtime path to include Vundle and initialize
" set rtp+=~/.config/nvim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/plugged')

" Plug 'VundleVim/Vundle.vim'

Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
" Plug 'mswift42/vim-themes'

Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'

Plug 'guns/vim-sexp'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'

Plug 'junegunn/fzf'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'

" Plug 'francoiscabrol/ranger.vim'
Plug 'rafaqz/ranger.vim'
Plug 'Shougo/deol.nvim'

Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim', { 'do': 'call jedi#configure_call_signatures()' }
Plug 'w0rp/ale'  " linting
Plug 'posva/vim-vue'

Plug 'rstacruz/sparkup'  " ?
Plug 'scrooloose/nerdcommenter'  " ?

" Plug 'ekalinin/Dockerfile.vim'  "

call plug#end()
" call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on
