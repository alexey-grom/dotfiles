if has('nvim')
    " set termguicolors
endif

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

" let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
" let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
" let g:CtrlSpaceSaveWorkspaceOnExit = 1
" let g:CtrlSpaceIgnoredFiles = '\v(tmp|temp)[\/]'

let g:sexp_enable_insert_mode_mappings = 0

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 0

let g:jedi#auto_initialization = 0
let g:jedi#completions_enabled = 0
" let g:jedi#goto_command = "<Leader>d"
" let g:jedi#goto_assignments_command = "<Leader>g"
" let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
" let g:jedi#usages_command = "<Leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<Leader>r"

" let g:ranger_map_keys = 0

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
autocmd FileType python iabbrev <buffer> ppr from pprint import pprint<cr>pprint()<Left>
autocmd FileType python iabbrev <buffer> ppdb import pdb; pdb.set_trace()
autocmd FileType javascript iabbrev <buffer> cl console.log()<Left>

augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END

source ~/.config/nvim/startup/plugins.vim
source ~/.config/nvim/startup/sets.vim
source ~/.config/nvim/startup/mapping.vim
source ~/.config/nvim/startup/sets.vim
source ~/.config/nvim/startup/ui.vim
