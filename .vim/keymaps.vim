"----------------------------------------
"      Mapping
"----------------------------------------
map gn :w<BAR>:cn<CR>
map gp :cp<CR>
nmap <F2> :tabnew $MYVIMRC<CR>
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
inoremap jj <ESC>
noremap j gj
noremap k gk
noremap <S-h> ^
noremap <S-l> $
noremap <S-k> {
noremap <S-j> }
noremap m %
"noremap : ;
"noremap ; :
noremap <C-c> <ESC>
nnoremap s <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap sv :<C-u>vs<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sO <C-w>=
nnoremap s+ <C-w>+
nnoremap s- <C-w>-
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap tt :<C-u>tabnew<CR>
nnoremap tn gt
nnoremap tp gT
nnoremap <silent><S-CR> o<ESC>
nnoremap <silent>j gj
nnoremap <silent>k gk
inoremap <C-f> <C-x><C-o>
