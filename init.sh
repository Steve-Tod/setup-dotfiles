# for ubuntu
pushd ~
# update apt-get
sudo apt-get update
sudo apt-get upgrade

# oh-my-zsh
sudo apt-get zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
zsh
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
vim ~/.zshrc
source ~/.zshrc

# node.js
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# vim
echo "set nocompatible             
set fileformat=unix           
set shiftwidth=2 | set expandtab 
syntax on
set nu

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dpelle/vim-LanguageTool'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on" > ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# ycm
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer

# shadowsocks
sudo apt-get install python-pip
sudo pip install shadowsocks
echo "alias ss_start='sudo ssserver -c ~/jiangzhenyu.json -d start'\nalias ss_stop='sudo ssserver -c ~/jiangzhenyu.json -d stop'" >> ~/.zshrc
source ~/.zshrc
echo "{
\"server\":\"0.0.0.0\",
\"server_port\":33333,
\"local_address\": \"127.0.0.1\",
\"local_port\":1080,
\"port_password\":{
	\"33333\":\"jierfangjiazhong\",
	\"32222\":\"jiangzhenyu\"
},
\"timeout\":300,
\"method\":\"chacha20\",
\"fast_open\": false
}" > ~/jiangzhenyu.json

# libsodium
wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
tar -xvf LATEST.tar.gz
cd libsodium-stable
./configure --prefix=/usr
make && make check
sudo make install
sudo ldconfig

# bbr
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh
chmod +x bbr.sh
sudo ./bbr.sh

popd
