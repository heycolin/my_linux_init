#!/usr/bin/env bash

_mkdir_() {
    if [ ! -e "$1" ]; then
        mkdir "$1"
    fi
}

local_dir="$HOME/my_linux_init"
git_uri="https://github.com/heycolin/my_linux_init.git"

# check vundle
if [ ! -e "$HOME/.vim/bundle/vundle" ]; then
    _mkdir_ "$HOME/.vim/bundle/vundle"
    git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
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
_lnfile_ "$HOME/.vim" "$HOME/.config/nvim"
_lnfile_ "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"
sudo cp $local_dir/*.ttf /usr/share/fonts/truetype/

# xx-net
git clone https://github.com/XX-net/XX-net.git $HOME/XX-net

# zsh plugins
git clone git://github.com/jimmijj/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/tarruda/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# solarized.git
git clone git://github.com/seebi/dircolors-solarized.git $HOME/dircolors-solarized
cp $HOME/dircolors-solarized/dircolors.256dark $HOME/.dircolors
eval 'dircolors .dircolors'
export TERM=xterm-256color
git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git $HOME/gnome-terminal-colors-solarized
$HOME/gnome-terminal-colors-solarized/set_dark.sh
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
