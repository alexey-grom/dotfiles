let mapleader = " "

vmap <leader>y "+y

map <C-n> :NERDTreeToggle<CR>
nmap <C-f> :NERDTreeFind<CR>
map <C-space> :CtrlSpace<CR>
nmap <F8> :TagbarToggle<CR>
noremap <silent> <C-l> :noh<CR><C-l>
imap <M-j> <Down>
imap <M-k> <Up>
imap <M-h> <Left>
imap <M-l> <Right>

" fugitive git bindings
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR><C-w>L
nnoremap <Leader>gc :Gcommit<CR><C-w>L
nnoremap <Leader>gf :Git fetch<CR>
nnoremap <Leader>gr :Git rebase -i<CR>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Git push<CR>
nnoremap <Leader>gpl :Git pull<CR>
" nnoremap <Leader>gc :Gcommit -v -q<CR>
" nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
" nnoremap <Leader>gd :Gdiff<CR>
" nnoremap <Leader>ge :Gedit<CR>
" nnoremap <Leader>gr :Gread<CR>
" nnoremap <Leader>gw :Gwrite<CR><CR>
" nnoremap <Leader>gp :Ggrep<Space>
" nnoremap <Leader>gm :Gmove<Space>
" nnoremap <Leader>gps :Dispatch! git push<CR>
" nnoremap <Leader>gpl :Dispatch! git pull<CR>
" nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>

nnoremap <Leader>f :copen<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>m :make<CR>

" braces
" inoremap {      {}<Left>
" inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
" inoremap {}     {}
" inoremap (      ()<Left>
" inoremap (<CR>  (<CR>)<Esc>O
" inoremap ((     (
" inoremap ()     ()
" inoremap [      []<Left>
" inoremap [<CR>  [<CR>]<Esc>O
" inoremap [[     [
" inoremap []     []
