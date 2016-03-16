" ======================================================================
" BASICS {{{
" ======================================================================
"
" llllll

set nocompatible
set noswapfile
set syntax=on
set scrolloff=1
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
set incsearch
" set statusline=\ %F\ %=\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}
autocmd VimEnter *
    \ let &statusline='%{bufferline#refresh_status()}'
      \ .bufferline#get_status_string()

let NERDTreeHijackNetrw=0
autocmd InsertEnter,InsertLeave * set cul!

" ======================================================================
" }}}
" ======================================================================
" ======================================================================
" APPEARANCE {{{
" ======================================================================

set t_Co=256
colorscheme base16-default
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_show_bufnr = 0
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" let g:airline_section_x = ''
" let g:airline_section_y = ''
" let g:airline_section_z = ''

" ======================================================================
" }}}
" ======================================================================
" ======================================================================
" MAPPINGS {{{
" ======================================================================
"
"
inoremap jj <Esc>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
vnoremap < <gv
vnoremap > >gv
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let mapleader = " "
nnoremap <silent> <leader>mm :make<CR>
nnoremap <silent> <leader>lc :! texcount '%'<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gm :Gmove<Space>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>ga :Git add<Space>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gA :Git add -A<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <C-e> <C-e><C-e>
nnoremap <C-y> <C-y><C-y>
nnoremap <leader>s :sh<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>p a<Space><Esc>p
nnoremap <leader>v :vsp ~/dotfiles/vimrc<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>i i<Space><Esc>
nnoremap <leader>a a<Space><Esc>
nnoremap <Tab> <C-w>w
nnoremap <F7> ggg?G``

" nnoremap <C-c>j <c-w>j<c-w>c<c-w>k
" nnoremap <C-c>k <c-w>k<c-w>c<c-w>j
" nnoremap <C-c>l <c-w>l<c-w>c<c-w>h
" nnoremap <C-c>h <c-w>h<c-w>c<c-w>l
"nnoremap <silent> <Plug>SpellCorrect1 1z=
"      \ :call repeat#set("\<Plug>SpellCorrect1")<CR>
"    UGG! not working
"nnoremap  <TAB> <Plug>SpellCorrect1
"true
nnoremap <S-Tab> 1z=
"EasyMotion rebinding
map <Leader>e <Plug>(easymotion-prefix)
nnoremap <silent> <C-l> :noh<CR>
nnoremap Y y$
nnoremap ; :
nnoremap : ;
nnoremap <C-n> n.
nnoremap <silent> Q @q
nnoremap <silent> <CR> :<C-U>wa<CR>:<C-U>!!<CR>
nnoremap <leader><CR> i<CR><Esc>
nnoremap t<CR> :Start<CR>
nnoremap m<CR> :wa<CR> :Make<CR>
nnoremap y<CR> :wa<CR> :!python %<CR>

nnoremap d<CR> :Dispatch!<CR>
autocmd FileType java let b:dispatch = 'javac %'
" autocmd FileType python let b:dispatch = 'python %'

autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
nnoremap <silent> <BS> :close<CR>
nnoremap gV `]v`[
if has('nvim')
    autocmd BufWinEnter,WinEnter term://* startinsert
    tnoremap <Esc> <C-\><C-n>
    tnoremap <S-Tab> <C-\><C-n><C-w><C-k>
endif
" function! s:goog(pat, lucky)
"   let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
"   let q = substitute(q, '[[:punct:] ]',
"        \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
"   call system(printf('open "https://www.google.com/search?%sq=%s"',
"                    \ a:lucky ? 'btnI&' : '', q))
" endfunction
" nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
" nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>

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
autocmd! bufwritepost ~/dotfiles/vimrc source %

" ======================================================================
" }}}
" ======================================================================
" ======================================================================
" PLUGINS {{{
" ======================================================================

call plug#begin('~/dotfiles/vim/plug')
Plug 'junegunn/vim-plug'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'
Plug 'bling/vim-bufferline'
Plug 'michaeljsmith/vim-indent-object'
Plug 'chriskempson/base16-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'godlygeek/csapprox'
Plug 'flazz/vim-colorschemes'
Plug 'SirVer/ultisnips'
Plug 'AndrewRadev/switch.vim'
" Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'unblevable/quick-scope'
Plug 'kien/ctrlp.vim'
Plug 'benekastah/neomake'
Plug 'tommcdo/vim-exchange'
Plug 'easymotion/vim-easymotion'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'tpope/vim-dispatch'
" Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-abolish'
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

function! s:map_change_option(...)
  let [key, opt] = a:000[0:1]
  let op = get(a:, 3, 'set '.opt.'!')
  execute printf("nnoremap co%s :%s<bar>echo '%s: '. &%s<cr>",
        \ key, op, opt, opt)
endfunction

call s:map_change_option('m', 'mouse', 'let &mouse = &mouse == "" ? "a" : ""')
call s:map_change_option('t', 'textwidth',
    \ 'let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw')
nnoremap cog :Goyo<CR>
nnoremap cop :RainbowParentheses!!<CR>

let g:instant_markdown_autostart = 0
let g:limelight_conceal_ctermfg = 'gray'

let g:surround_76 = "\\\1command: \1\{\r\}"
let g:surround_101 = "\\emph\{\r\}"
let g:surround_99 = "(\1function: \1 \r)"

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
