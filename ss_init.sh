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
