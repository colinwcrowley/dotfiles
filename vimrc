" ======================================================================
" BASICS {{{
" ======================================================================
"
"
" (other stuff)(replace this placeholder)

set nocompatible
set noswapfile
set cul
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
set relativenumber
set formatprg=par\ -w72
set formatoptions+=w
set tw=72
set clipboard=unnamed
set undolevels=10000
set history=10000
set incsearch
" set statusline=\ %F\ %=\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}
" autocmd VimEnter *
"     \ let &statusline='%{bufferline#refresh_status()}'
"       \ .bufferline#get_status_string()

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
inoremap fd $
inoremap df \
inoremap jk {
inoremap kj }
inoremap ,. , \ldots, 

"greek for latex
inoremap fja \alpha
inoremap fjb \beta
inoremap fjg \gamma
inoremap fjd \delta
inoremap fje \epsilon
inoremap fjz \zeta
inoremap fji \iota
inoremap fjk \kappa
inoremap fjl \lambda
inoremap fjm \mu
inoremap fjn \nu
inoremap fjx \xi
inoremap fjo \theta
inoremap fjp \pi
inoremap fjr \rho
inoremap fjs \sigma
inoremap fjt \tau
inoremap fju \upsilon
inoremap fjf \phi
inoremap fjc \chi
inoremap fjy \psi
inoremap fjw \omega

"greek for latex
inoremap cja \Alpha
inoremap cjb \Beta
inoremap cjg \Gamma
inoremap cjd \Delta
inoremap cje \Epsilon
inoremap cjz \Zeta
inoremap cji \Iota
inoremap cjk \Kappa
inoremap cjl \Lambda
inoremap cjm \Mu
inoremap cjn \Nu
inoremap cjx \Xi
inoremap cjo \Theta
inoremap cjp \Pi
inoremap cjr \Rho
inoremap cjs \Sigma
inoremap cjt \Tau
inoremap cju \Upsilon
inoremap cjf \Phi
inoremap cjc \Chi
inoremap cjy \Psi
inoremap cjw \Omega


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
nnoremap <leader>gk :Gpush<CR>
nnoremap <leader>gj :Gpull<CR>
nnoremap <C-e> <C-e><C-e>
nnoremap <C-y> <C-y><C-y>
nnoremap <leader>s :sh<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>p a<Space><Esc>p
nnoremap <leader>v :vsp ~/dotfiles/vimrc<CR>
" nnoremap <leader>v :echo "Don't you dare!!"<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>i i<Space><Esc>
nnoremap <leader>a a<Space><Esc>
nnoremap <leader>; A;<Esc>
nnoremap <leader>q :cclose<CR>
nnoremap <C-p> :<C-p>
" nnoremap <Tab> <C-w>w
nnoremap <F7> ggg?G``
nnoremap cm i\V{<Esc>la}<Esc>h
" nnoremap s :!
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
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
map , <Plug>(easymotion-prefix)
nnoremap Y y$
nnoremap ; :
nnoremap : ;
" nnoremap <C-n> n.
nnoremap <silent> Q @q
nnoremap <silent> <CR> :<C-U>wa<CR>:<C-U>!!<CR>
nnoremap <leader><CR> q:?
nnoremap t<CR> :Start<CR>
nnoremap m<CR> :wa<CR> :Make<CR>
nnoremap y<CR> :wa<CR> :!python %<CR>

nnoremap d<CR> :Dispatch<CR>
autocmd FileType javascript let b:dispatch = 'nodeunit'
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

" fun! <SID>StripTrailingWhitespaces()
"     let l = line(".")
"     let c = col(".")
"     %s/\s\+$//e
"     call cursor(l, c)
" endfun
" autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" fun! <SID>TrimEndLines()
"     let save_cursor = getpos(".")
"     :silent! %s#\($\n\s*\)\+\%$##
"     call setpos('.', save_cursor)
" endfun
" autocmd BufWritePre * :call <SID>TrimEndLines()
autocmd! bufwritepost .vimrc source % | source %
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
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
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
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-endwise'
Plug 'bronson/vim-visual-star-search'
Plug 'panozzaj/vim-autocorrect'
Plug 'rking/ag.vim'
Plug 'bps/vim-textobj-python', { 'for': 'python'}
Plug 'rbonvall/vim-textobj-latex', { 'for': 'tex'}
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'suan/vim-instant-markdown', { 'for': 'markdown'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmhedberg/matchit'
call plug#end()

let g:ctrlp_map = '<leader>f'

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

let g:surround_{char2nr('c')} = "\\\1command\1{\r}"

let g:surround_76 = "\\\1command: \1\{\r\}"
let g:surround_101 = "\\emph\{\r\}"
" let g:surround_99 = "(\1function: \1 \r)"

" autocmd! BufWritePost * Neomake
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
