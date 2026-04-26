" SETTINGS

let mapleader = " "
set clipboard=unnamedplus

" tabbing
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" line visibility
set number
set nowrap
set scrolloff=5

" cosmetic
set termguicolors
set background=dark " used by some themes to set dark/light mode

" search settings
set ignorecase
set smartcase
nnoremap <esc> <cmd>nohlsearch<cr>

" split direction
set splitbelow
set splitright

" KEYBINDS

" move up/down visually
noremap j gj
noremap k gk

" home
noremap H g^

" end
noremap L g$

" x to cut
nnoremap x d
xnoremap x d
nnoremap xx dd
nnoremap X D

" make d not yank
nnoremap d "_d
xnoremap d "_d
nnoremap D "_D
xnoremap D "_D

" make c not yank
nnoremap c "_c
xnoremap c "_c
nnoremap C "_C
xnoremap C "_C

" make s not yank
nnoremap s "_s
xnoremap s "_s
nnoremap S "_S
xnoremap S "_S

" 'P' behaves weirdly when the ends at the end of a line. that case needs to
" be handled differently
function! VisualPaste()
  " col position at end of the visual mode selection
  let l:end_col = col("'>")
  " length of the last line in visual mode selection
  let l:line_length = col([line("'>"), "$"])

  " delete into black hole in either case
  normal! gv"_d

  if l:end_col >= l:line_length - 1
    " if selection is at (or after) eol, paste after
    normal! p
  else
    " else, paste before
    normal! P
  endif
endfunction

" make p (visual) not yank
xnoremap p :<c-u>call VisualPaste()<cr>
xnoremap P :<c-u>call VisualPaste()<cr>

" Y to yank and keep visual mode selection
xnoremap Y ygv

" window commands
nmap <leader>q <cmd>q<cr>
nnoremap <c-h> <cmd>wincmd h<cr>
nnoremap <c-j> <cmd>wincmd j<cr>
nnoremap <c-k> <cmd>wincmd k<cr>
nnoremap <c-l> <cmd>wincmd l<cr>

" buffer commands
nmap <leader>s <cmd>w<cr>
nmap <s-tab> <cmd>bprev<cr>
nmap <tab> <cmd>bnext<cr>

" exit term mode
tnoremap <c-\><c-\> <c-\><c-n>

