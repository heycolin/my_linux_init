#!/usr/bin/env bash

#spf13_dir="$HOME/.spf13-vim-3"
#
#git_uri="https://github.com/zhiqunq/vim-local.git"
#git_branch="master"
#local_dir="$HOME/.vim-local"
#local_spf13_dir="$local_dir/spf13-vim"
#
#if [ ! -e "$local_dir" ]; then
#    git clone --recursive -b "$git_branch" "$git_uri" "$local_dir"
#fi
#
#if [ ! -e "$spf13_dir" ]; then
#    ln -sf "$local_spf13_dir" "$spf13_dir"
#fi
#
#lnfile() {
#    if [ -e "$local_dir/$1" ]; then
#        ln -sf "$local_dir/$1" "$HOME/.$1"
#    fi
#}
#
#lnfile "vimrc.before.fork"
#
#
#bash "$spf13_dir/bootstrap.sh"
#
#lnfile "vimrc.local"
#lnfile "vimrc.bundles.local"

######################################################################

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

# cp file
cp "$local_dir/bundles.vim" "$HOME/.vim/"
cp "$local_dir/vimrc" "$HOME/.vimrc"
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
