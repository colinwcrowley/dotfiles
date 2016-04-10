cd
git clone https://github.com/colinwcrowley/dotfiles.git
cd dotfiles
git stash && git pull
cd
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
vim +PlugClean +PlugInstall
