#!/usr/bin/env bash

_mkdir_() {
    if [ ! -e "$1" ]; then
        mkdir "$1"
    fi
}

local_dir="$HOME/my_vim_set"
git_uri="https://github.com/heycolin/my_vim_set.git"

# check vundle
if [ ! -e "$HOME/.vim/bundle/vundle" ]; then
    _mkdir_ "$HOME/.vim/bundle/vundle"
    git clone https://github.com/gmarik/vundle.git $HOME/.vim1/bundle/vundle
fi

# check my_vimrc
if [ ! -e "$local_dir" ]; then
    git clone "$git_uri" "$local_dir"
fi

# ln file
do_backup() {
    if [ -e "$2" ]; then
        today=`date +%Y%m%d_%s`
        mv "$2" "$2.$today"
    fi
}
_lnfile_() {
    do_backup "$1" "$2"
    ln -sf "$1" "$2"
}
_lnfile_ "$local_dir/bundles.vim" "$HOME/.vim/bundles.vim"
_lnfile_ "$local_dir/vimrc" "$HOME/.vimrc"
_lnfile_ "$local_dir/zshrc" "$HOME/.zshrc"
sudo cp $local_dir/*.ttf /usr/share/fonts/truetype/
# sudo fc-cache -f -v

# font file for powline
_update_ttf_of_powline_() {
    _mkdir_ "$HOME/.fonts"
    cd $HOME/.fonts
    cp $local_dir/*.ttf $HOME/.fonts/
    mkfontscale
    mkfontdir
    sudo fc-cache -f -v
    rm $HOME/.vim/bundle/vim-powerline/*.cache
}
_update_ttf_of_powline_
