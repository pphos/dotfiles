#!/bin/sh -u

# install Neovim
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt update
sudo apt -y install neovim
mkdir -p ~/.config/nvim/

# add clipboard
sudo apt-get -y install xsel

# install python3
if ! type python3 > /dev/null; then
	sudo apt-get -y install python-dev python-pip python3-dev python3-pip
fi
pip install --upgrade neovim
pip3 install --upgrade neovim

# install dein
mkdir -p ~/.cache/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.cache/dein/repos/github.com/Shougo/dein.vim

# make symbolic link (stopgap measure)
if [ -e ~/.config/nvim ]; then
	rm -rf ~/.config/nvim
fi
ln -ns ~/dotfiles/.fonts ~/
ln -ns ~/dotfiles/nvim ~/.config

fc-cache -vf
