let s:cpo_save=&cpo
set cpo&vim
tnoremap <BS> 
nnoremap <NL> j
nnoremap  k
nnoremap  l
nnoremap <silent>  :CtrlP
nnoremap + +
nnoremap ,n :NERDTreeToggle
nnoremap ,t :belowright sp:term
nnoremap - -
vmap [% [%m'gv``
vmap ]% ]%m'gv``
vmap a% [%v]%
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nnoremap <BS> h
tnoremap <NL> <NL>
tnoremap  
tnoremap  
tnoremap  
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set clipboard=unnamed
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set formatoptions=tcqjw
set formatprg=par\ -w72
set helplang=en
set runtimepath=~/.config/nvim,~/.config/nvim/plug/vim-plug/,~/.config/nvim/plug/neomake/,~/.config/nvim/plug/nerdtree/,~/.config/nvim/plug/ctrlp.vim/,/etc/xdg/nvim,~/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/local/Cellar/neovim/0.1.0/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,~/.local/share/nvim/site/after,/etc/xdg/nvim/after,~/.config/nvim/after
set shiftwidth=2
set textwidth=72
set undolevels=100000
set window=37
" vim: set ft=vim :
