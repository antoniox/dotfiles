#!/bin/bash

set -ex

bundle_dir=$(pwd)/vimrc/bundle

if [[ ! -d "$bundle_dir" ]]; then
   mkdir $bundle_dir
fi

git clone git://github.com/gmarik/Vundle.vim.git $bundle_dir/Vundle.vim

vim +PluginInstall +qall
if [[ -x $HOME/.vim ]]; then
    mv $HOME/.vim $HOME/.vim.bak
fi

if [[ -x $HOME/.vimrc ]]; then
    mv $HOME/.vimrc $HOME/.vimrc.bak
fi

ln -s $(pwd)/vimrc $HOME/.vim
ln -s $(pwd)/vimrc/vimrc $HOME/.vimrc

sudo apt-get install python-flake8 ghc-mod

#compile YCM
cd $bundle_dir/YouCompleteMe && ./install.sh && cd -
