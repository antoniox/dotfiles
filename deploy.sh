#!/bin/bash

bundle_dir=$(pwd)/vimrc/bundle

if [[ ! -d "$bundle_dir" ]]; then
    mkdir $bundle_dir
fi

git clone git://github.com/gmarik/Vundle.vim.git $bundle_dir/Vundle.vim
vim +PluginInstall +qall
