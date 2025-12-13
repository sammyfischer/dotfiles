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
set guifont=CaskaydiaCove\ NF
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

" home
nnoremap H ^
xnoremap H ^
onoremap H ^

" end
nnoremap L $
xnoremap L $
onoremap L $

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

" make p (visual) not yank
xnoremap p "_dP
xnoremap P "_dP

" Y to yank and keep visual mode selection
xnoremap Y ygv

" window commands
nmap <leader>q <cmd>q<cr>
nmap <leader>ws <cmd>split<cr>
nmap <leader>wv <cmd>vsplit<cr>
nmap <leader>wt <cmd>wincmd T<cr>

" window navigation
nnoremap <c-h> <cmd>wincmd h<cr>
nnoremap <c-j> <cmd>wincmd j<cr>
nnoremap <c-k> <cmd>wincmd k<cr>
nnoremap <c-l> <cmd>wincmd l<cr>

" buffer commands
nmap <leader>s <cmd>w<cr>

" buffer navigation
nmap [<tab> <cmd>bprev<cr>
nmap ]<tab> <cmd>bnext<cr>

" exit term mode
tnoremap <c-\><c-\> <c-\><c-n>

" closes current quote, inserts comma, opens a new quote. helpful for writing
" arrays of strings
function! s:ArrayQuoteString() abort
  let line = getline('.')
  let col  = col('.') - 1
  let before = strpart(line, 0, col)

  " search backwards until there's a quote
  let idx = match(before, "['\"`][^'\"`]*$")
  if idx == -1
    return ''
  endif

  let quote = before[idx]
  return quote . ', ' . quote
endfunction

inoremap <expr> <C-'> <SID>ArrayQuoteString()

