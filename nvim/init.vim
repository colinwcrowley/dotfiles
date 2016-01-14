source ~/dotfiles/vimrc

nnoremap <silent> <leader>tj :belowright sp<CR>:term<CR>
nnoremap <silent> <leader>tl :belowright vsp<CR>:term<CR>
nnoremap <silent> <leader>tk :sp<CR>:term<CR>
nnoremap <silent> <leader>th :vsp<CR>:term<CR>
nnoremap <silent> <leader>tt :<C-u>term<CR>

nnoremap <leader><CR> :belowright sp<CR>:term<CR>

autocmd BufWinEnter,WinEnter term://* startinsert

nnoremap <silent> <CR> :belowright sp<CR>:term<CR>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>
