#!/bin/bash

bundle_dir=$(pwd)/vimrc/bundle

if [[ ! -d "$bundle_dir" ]]; then
   mkdir $bundle_dir
fi

git clone git://github.com/gmarik/Vundle.vim.git $bundle_dir/Vundle.vim
vim +PluginInstall +qall

sudo apt-get install python-flake8 ghc-mod

#compile YCM
cd $bundle_dir/YouCompleteMe && ./install.sh && cd -

mv $HOME/.vim $HOME/.vim.bak
mv $HOME/.vimrc $HOME/.vimrc.bak

ln -s $(pwd)/vimrc $HOME/.vim
ln -s $(pwd)/vimrc/vimrc $HOME/.vimrc
