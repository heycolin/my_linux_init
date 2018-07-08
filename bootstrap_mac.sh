#!/usr/bin/env bash

_mkdir_() {
    if [ ! -e "$1" ]; then
        mkdir "$1"
    fi
}

local_dir="$HOME/my_linux_init"
git_uri="https://github.com/heycolin/my_linux_init.git"

############################
# you should run 'csrutils disable' first reboot with command+R
# for brew's permission
############################
sudo chown -R $(whoami) /usr/local

############################
# install vim +lua +python override-system-vim
# @see brew info vim
############################
brew install vim --with-lua --with-python@2 --with-override-system-vim

############################
# oh-my-zsh
############################
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

############################
# vim's plug maneger
############################
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

############################
# check vundle
############################
# if [ ! -e "$HOME/.vim/bundle/vundle" ]; then
#     _mkdir_ "$HOME/.vim/bundle/vundle"
#     git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
# fi

############################
# check my_vimrc
############################
if [ ! -e "$local_dir" ]; then
    git clone "$git_uri" "$local_dir"
fi

############################
# link file
############################
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
# _lnfile_ "$local_dir/bundles.vim" "$HOME/.vim/bundles.vim"
_lnfile_ "$local_dir/vimrc" "$HOME/.vimrc"
_lnfile_ "$local_dir/zshrc_mac_book" "$HOME/.zshrc"
# _lnfile_ "$HOME/.vim" "$HOME/.config/nvim"
# _lnfile_ "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"
sudo cp $local_dir/*.ttf /usr/share/fonts/truetype/

############################
# zsh plugins
############################
git clone git://github.com/jimmijj/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone git://github.com/tarruda/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

############################
# solarized.git
############################
git clone git://github.com/seebi/dircolors-solarized.git $HOME/dircolors-solarized
cp $HOME/dircolors-solarized/dircolors.256dark $HOME/.dircolors
# eval 'dircolors .dircolors'
export TERM=xterm-256color
git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git $HOME/gnome-terminal-colors-solarized
$HOME/gnome-terminal-colors-solarized/set_dark.sh
# sudo fc-cache -f -v

############################
# font file for powline
############################
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
