" ======================================================================
" BASICS {{{
" ======================================================================
set syntax=on
set noshowmode
set number
set mouse=a
set background=dark
set tabstop=8
set shiftwidth=4
set expandtab smarttab autoindent
set backspace=eol,indent,start
set laststatus=2
set wrap nolist linebreak
set formatprg=par\ -w72
set formatoptions+=w
set tw=72
set clipboard=unnamed
set undolevels=10000
set history=10000
set incsearch hlsearch
" ======================================================================
" }}}
" ======================================================================
" ======================================================================
" APPEARANCE {{{
" ======================================================================
colorscheme base16-default
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
" ======================================================================
" }}}
" ======================================================================
" ======================================================================
" MAPPINGS {{{
" ======================================================================
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
vnoremap < <gv
vnoremap > >gv
let mapleader = " "
nnoremap <silent> <leader>sj :<C-u>belowright sp<CR>
nnoremap <silent> <leader>sk :<C-u>sp<CR>
nnoremap <silent> <leader>sl :<C-u>belowright vsp<CR>
nnoremap <silent> <leader>sh :<C-u>vsp<CR>
nnoremap <silent> <leader>mm :<C-u>make<CR>
nnoremap <silent> <leader>lc :<C-u>! texcount '%'<CR>
nnoremap <silent> <leader>gs :<C-u>Gstatus<CR>
nnoremap <silent> <leader>gm :<C-u>Gmove<Space>
nnoremap <silent> <leader>gc :<C-u>Gcommit<CR>
nnoremap <leader>gb :<C-u>Git branch<Space>
nnoremap <leader>go :<C-u>Git checkout<Space>
nnoremap <leader>ga :<C-u>Git add<Space>
nnoremap <silent> <leader>gA :<C-u>Git add -A<CR>
nnoremap <leader>gp :<C-u>Git push<CR>
nnoremap <C-e> <C-e><C-e>
nnoremap <C-y> <C-y><C-y>
nnoremap <leader>w :w<CR>
nnoremap <leader>q ZZ<CR>
nnoremap <Tab> <C-w>w
nnoremap <c-c>j <c-w>j<c-w>c<c-w>k
nnoremap <c-c>k <c-w>k<c-w>c<c-w>j
nnoremap <c-c>l <c-w>l<c-w>c<c-w>h
nnoremap <c-c>h <c-w>h<c-w>c<c-w>l
"nnoremap <silent> <Plug>SpellCorrect1 1z=
"      \ :call repeat#set("\<Plug>SpellCorrect1")<CR>
"    UGG! not working
"nnoremap  <TAB> <Plug>SpellCorrect1
nnoremap <S-Tab> 1z=
"EasyMotion rebinding
map <Leader>e <Plug>(easymotion-prefix)
nnoremap <silent> <C-l> :noh<CR>
nnoremap Y y$
nnoremap ; :
nnoremap : ;
nnoremap <silent> Q @q
nnoremap <silent> <CR> :<C-U>wa<CR>:<C-U>!!<CR>
nnoremap gV `]v`[
if has('nvim')
    autocmd BufWinEnter,WinEnter term://* startinsert
    tnoremap <Esc> <C-\><C-n>
    tnoremap <S-Tab> <C-\><C-n><C-w><C-k>
endif
function! s:goog(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
endfunction
nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
" ======================================================================
" }}}
" ======================================================================
" ======================================================================
" WHITESPACE {{{
" ======================================================================
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
autocmd! bufwritepost .vimrc source %
" ======================================================================
" }}}
" ======================================================================
" ======================================================================
" PLUGINS {{{
" ======================================================================
call plug#begin('~/dotfiles/vim/plug')
Plug 'junegunn/vim-plug'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'godlygeek/csapprox'
Plug 'flazz/vim-colorschemes'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'unblevable/quick-scope'
Plug 'kien/ctrlp.vim'
Plug 'benekastah/neomake'
Plug 'tommcdo/vim-exchange'
Plug 'easymotion/vim-easymotion'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-visual-star-search'
Plug 'panozzaj/vim-autocorrect'
Plug 'rking/ag.vim'
Plug 'bps/vim-textobj-python', { 'for': 'python'}
Plug 'rbonvall/vim-textobj-latex', { 'for': 'tex'}
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'suan/vim-instant-markdown', { 'for': 'markdown'}
call plug#end()

let g:instant_markdown_autostart = 0

let g:surround_76 = "\\\1command: \1\{\r\}"
let g:surround_101 = "\\emph\{\r\}"

autocmd! BufWritePost * Neomake
sign define neomake_err texthl=SignColumn
sign define neomake_warn texthl=SignColumn
sign define neomake_info texthl=SignColumn
sign define neomake_msg texthl=SignColumn
let g:neomake_verbose=0

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" ======================================================================
" }}}
" ======================================================================
" ======================================================================
" Ideas {{{
" ======================================================================
" nnoremap H 0
" nnoremap L $
" nnoremap ' `
" nnoremap ` '
" nnoremap N Nzz
" nnoremap n nzz
" ======================================================================
" }}}
" ======================================================================
