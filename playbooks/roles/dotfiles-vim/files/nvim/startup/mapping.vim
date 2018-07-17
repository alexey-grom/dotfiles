command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let mapleader = " "

vmap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>Y "+yg_
nnoremap <Leader>y "+y
nnoremap <Leader>yy "+yy
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

noremap <silent> <C-l> :noh<CR><C-l>
imap <M-j> <Down>
imap <M-k> <Up>
imap <M-h> <Left>
imap <M-l> <Right>

nnoremap <silent> <M-h> zC
nnoremap <silent> <M-s> zO
nnoremap <silent> <C-M-h> zM
nnoremap <silent> <C-M-s> zR

let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" nnoremap <Leader>ga :Git add %:p<CR><CR>
" nnoremap <Leader>gs :Gstatus<CR><C-w>L
" nnoremap <Leader>gc :Gcommit<CR><C-w>L
" nnoremap <Leader>gbl :Gblame<CR>
" nnoremap <Leader>gf :Git fetch<CR>
" nnoremap <Leader>gi :Git rebase -i<CR>
" nnoremap <Leader>gbr :Git branch<Space>
" nnoremap <Leader>go :Git checkout<Space>
" nnoremap <Leader>grs :Git push<CR>
" nnoremap <Leader>grl :Git pull<CR>

nnoremap <Leader>fs :w<CR>
nnoremap <Leader>fm :make<CR>
nnoremap <Leader>fl :source %<CR>

nnoremap <Leader><Leader> :Buffers<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bd :bprevious<CR>:bdelete #<CR>
nnoremap <Leader>bk :bprevious<CR>:bdelete! #<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>

nnoremap <Leader>tc :tabnew<CR>
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>

nnoremap <Leader>sa :Ag<CR>
nnoremap <Leader>sw :Ag <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>sf :Files<CR>
" nnoremap <Leader>sg :GFiles?<CR>
nnoremap <Leader>sm :Marks<CR>
nnoremap <Leader>sc :Commits<CR>

augroup pyadds
  au!
  autocmd FileType python iabbrev <buffer> ppr from pprint import pprint<CR>pprint()<Left>
  autocmd FileType python iabbrev <buffer> ppdb import pdb; pdb.set_trace()
  autocmd FileType python nnoremap <buffer> <Leader>sg :call jedi#goto()<CR>
  autocmd FileType python nnoremap <buffer> <Leader>su :call jedi#usages()<CR>
  autocmd FileType python nnoremap <buffer> <Leader>sr :call jedi#rename()<CR>
  autocmd FileType python vnoremap <buffer> <Leader>sr :call jedi#rename_visual()<CR>
augroup END

augroup jsadds
  au!
  autocmd FileType javascript iabbrev <buffer> cl console.log()<Left>
augroup END

nnoremap <Leader>ls :mksession! .session.vim<CR>
nnoremap <Leader>ll :source .session.vim<CR>

nnoremap <Leader>cc :copen<CR>
nnoremap <Leader>cq :cclose<CR>
nnoremap <Leader>cj :cnext<CR>
nnoremap <Leader>ck :cprev<CR>

nnoremap <Leader>tw0 :set nowrap<CR>
nnoremap <Leader>tw1 :set wrap<CR>

nnoremap <Leader>ar :RangerEdit<CR>
nnoremap <Leader>as :Deol<CR>
nnoremap <Leader>ag :Magit<CR>

