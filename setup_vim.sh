#!/bin/bash
rm ~/.vimrc
ln -s ~/rc/.vimrc ~/.vimrc 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/colors
cp -R ~/rc/.vim/ ~/.vim
