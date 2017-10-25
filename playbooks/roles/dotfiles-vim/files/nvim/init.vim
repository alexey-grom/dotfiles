if has('nvim')
    " set termguicolors
endif

source ~/.config/nvim/startup/plugins.vim
source ~/.config/nvim/startup/sets.vim
source ~/.config/nvim/startup/mapping.vim
source ~/.config/nvim/startup/sets.vim
source ~/.config/nvim/startup/ui.vim

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_theme='base16_eighties'
" let g:airline_theme='cobalt2'
let g:airline_theme='wombat'

let g:UltiSnipsExpandTrigger="<Leader>s"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp)[\/]'

let NERDTreeIgnore=['__pycache__', '\.pyc']

"autocmd FileType python highlight ColorColumn ctermbg=235 " подсветка ограничительной колонки
autocmd FileType python,javascript,go,conf,vim,lua,erlang,clojure autocmd BufWritePre * %s/\s\+$//e " трим строк перед сохранением

augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END
