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
source ~/.zshrc

# node.js
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# vim
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
