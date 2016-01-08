set syntax=on
set number
set relativenumber

set background=dark
colorscheme base16-default

let mapleader = " "
nnoremap <silent> <leader>tj :belowright sp<CR>:term<CR>
nnoremap <silent> <leader>tl :belowright vsp<CR>:term<CR>
nnoremap <silent> <leader>tk :sp<CR>:term<CR>
nnoremap <silent> <leader>th :vsp<CR>:term<CR>
nnoremap <silent> <leader>tt :<C-u>term<CR>
nnoremap <silent> <leader>sj :<C-u>belowright sp<CR>
nnoremap <silent> <leader>sk :<C-u>sp<CR>
nnoremap <silent> <leader>sl :<C-u>belowright vsp<CR>
nnoremap <silent> <leader>sh :<C-u>vsp<CR>
nnoremap <silent> <leader>n :<C-u>NERDTreeToggle<CR>
nnoremap <silent> <leader>mm :<C-u>make<CR>
nnoremap <silent> <leader>lc :<C-u>! texcount '%'<CR>

nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <leader>gm :<C-u>Gmove<Space>
nnoremap <silent> <leader>gc :<C-u>Gcommit<CR>
nnoremap <leader>gb :<C-u>Git branch<Space>
nnoremap <leader>go :<C-u>Git checkout<Space>
nnoremap <leader>ga :<C-u>Git add<Space>
nnoremap <leader>gp :<C-u>Git push<CR>

nnoremap <leader>cd :<C-u>cd %:p:h<CR>:pwd<CR>

nnoremap <leader><CR> :belowright sp<CR>:term<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q ZZ<CR>

nnoremap <silent> <Plug>SpellCorrect1 1z=
      \ :call repeat#set("\<Plug>SpellCorrect1")<CR>

nmap <silent> Q @q


"EasyMotion rebinding
map <Leader>e <Plug>(easymotion-prefix)

autocmd BufWinEnter,WinEnter term://* startinsert

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap Y y$
nnoremap ; :
nnoremap : ;
"nnoremap <silent> <CR> :<C-U>wa<CR>:<C-U>!!<CR>
nnoremap <silent> <CR> :belowright sp<CR>:term<CR>
nnoremap <silent> <Esc> :noh<CR>
" Make sure that this doesn't screw up the command line window.
augroup commandlinewindow
  autocmd!
  autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
augroup END

tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>

"          _     _ _
"__      _| |__ (_) |_ ___  ___ _ __   __ _  ___ ___
"\ \ /\ / / '_ \| | __/ _ \/ __| '_ \ / _` |/ __/ _ \
" \ V  V /| | | | | ||  __/\__ \ |_) | (_| | (_|  __/
"  \_/\_/ |_| |_|_|\__\___||___/ .__/ \__,_|\___\___|
"                              |_|
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

fun! <SID>TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfun
autocmd BufWritePre * :call <SID>TrimEndLines()

let g:surround_76 = "\\\1command: \1\{\r\}"
let g:surround_101 = "\\emph\{\r\}"

set tabstop=8
set expandtab
set shiftwidth=2
set smarttab autoindent
set mouse=a

set laststatus=2

set wrap nolist linebreak
set breakindent
set formatprg=par\ -w72
set formatoptions+=w
set tw=72

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

set clipboard=unnamed
set undolevels=1000000
"set hlsearch
set incsearch

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''

autocmd! BufWritePost * Neomake
sign define neomake_err texthl=SignColumn
sign define neomake_warn texthl=SignColumn
sign define neomake_info texthl=SignColumn
sign define neomake_msg texthl=SignColumn
let g:neomake_verbose=0
set noshowmode

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

call plug#begin('~/.config/nvim/plug')
Plug 'junegunn/vim-plug'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'

Plug 'joshdick/onedark.vim'
Plug 'gilgigilgil/anderson.vim'
Plug 'jscappini/material.vim'
Plug 'godlygeek/csapprox'
Plug 'flazz/vim-colorschemes'
Plug 'mkarmona/materialbox'
Plug 'thinca/vim-guicolorscheme'

Plug 'bps/vim-textobj-python', { 'for': 'python'}
Plug 'rbonvall/vim-textobj-latex', { 'for': 'tex'}

"Plug 'Valloric/YouCompleteMe', { 'for': 'python' }
"autocmd! User YouCompleteMe call youcompleteme#Enable()

Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'unblevable/quick-scope'
Plug 'kien/ctrlp.vim'
Plug 'benekastah/neomake'
Plug 'tommcdo/vim-exchange'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-visual-star-search'
Plug 'panozzaj/vim-autocorrect'
Plug 'rking/ag.vim'
"Plug 'sjl/gundo.vim'
Plug 'suan/vim-instant-markdown', { 'for': 'markdown'}
let g:instant_markdown_autostart = 0

call plug#end()
