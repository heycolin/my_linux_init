sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update

sudo apt-get install awesome
sudo apt-get install dmenu

sudo apt-get install git gitk git-svn ssh
sudo apt-get install gdb g++ gcc cmake make
sudo apt-get install scons

sudo apt-get install zsh
chsh -s /bin/zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo apt-get install vim-gnome
sudo apt-get install neovim
sudo apt-get install ctags

sudo apt-get install lua5.1
sudo apt-get install liblua5.1-0-dev
sudo apt-get install python
sudo apt-get install python-pip
sudo apt-get install python-dev
sudo apt-get install python-dev
sudo apt-get install python-vte
sudo apt-get install libglew-dev
sudo apt-get install pipe

sudo apt-get install xsel
sudo apt-get install shutter
sudo apt-get install rar unrar
sudo apt-get install fcitx-googlepinyin
sudo apt-get install chromium-browser
sudo apt-get install flashplugin-installer

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
