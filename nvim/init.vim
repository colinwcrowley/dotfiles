source ~/dotfiles/vimrc

autocmd BufWinEnter,WinEnter term://* startinsert
tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>
