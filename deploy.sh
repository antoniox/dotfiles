#!/bin/bash

bundle_dir=$(pwd)/vim/bundle

if [[ ! -d "$bundle_dir" ]]; then
    mkdir $bundle_dir
fi

for name in vim vimrc bashrc gitconfig bash_functions; do
    if [[ -f $HOME/.$name || -d $HOME/.$name || -L $HOME/.$name ]]; then
        mv $HOME/.$name $HOME/.$name\.bak
    fi

    ln -s $(pwd)/$name $HOME/.$name
done

if [[ ! -d "$bundle_dir/Vundle.vim" ]]; then
    git clone git://github.com/gmarik/Vundle.vim.git $bundle_dir/Vundle.vim
fi

vim +PluginInstall +qall

# sudo apt-get install python-flake8 ghc-mod
#
# cd $bundle_dir/YouCompleteMe && ./install.sh && cd -
