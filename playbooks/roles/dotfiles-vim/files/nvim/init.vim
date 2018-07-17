if has('nvim')
    " set termguicolors
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_theme='base16_eighties'
" let g:airline_theme='cobalt2'
let g:airline_theme='wombat'

" let g:UltiSnipsExpandTrigger="<Leader>s"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
" let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
" let g:CtrlSpaceSaveWorkspaceOnExit = 1
" let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp)[\/]'

let g:ale_set_highlights = 0
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:sexp_enable_insert_mode_mappings = 0

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 0

let g:jedi#auto_initialization = 0
let g:jedi#completions_enabled = 0

let g:magit_default_show_all_files = 0
let g:magit_default_fold_level = 0

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

function! s:close_buffers(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    echo val
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-f': 'bdelete!',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"autocmd FileType python highlight ColorColumn ctermbg=235 " подсветка ограничительной колонки
autocmd FileType python,javascript,go,conf,vim,lua,erlang,clojure autocmd BufWritePre * %s/\s\+$//e " трим строк перед сохранением

augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END

source ~/.config/nvim/startup/plugins.vim
source ~/.config/nvim/startup/sets.vim
source ~/.config/nvim/startup/mapping.vim
source ~/.config/nvim/startup/sets.vim
source ~/.config/nvim/startup/ui.vim
