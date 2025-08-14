" home
nnoremap H g^
xnoremap H g^
onoremap H g^

" end
nnoremap L g$
xnoremap L g$
onoremap L g$

" X to delete char (does not copy)
nnoremap X "_x
xnoremap X "_x

" x to cut
nnoremap x d
xnoremap x d

" xx to cut entire line
nnoremap xx dd

" d to delete (does not copy)
nnoremap d "_d
xnoremap d "_d
nnoremap D "_D
xnoremap D "_D

" c to change (does not copy)
nnoremap c "_c
xnoremap c "_c
nnoremap C "_C
xnoremap C "_C

" p to paste (does not copy visual mode selection)
xnoremap p "_dP
xnoremap P "_dP

" Y to yank and keep visual mode selection
xnoremap Y ygv

" Esc to clear search highlight
nnoremap <Esc> <Cmd>nohlsearch<CR> 

