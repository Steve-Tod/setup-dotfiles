# shadowsocks
python -c "from utils import search_package_and_install; search_package_and_install(['python-pip'])"
sudo pip install shadowsocks
cp jiangzhenyu.json ~/jiangzhenyu.json
echo "alias ss_start='sudo ssserver -c ~/jiangzhenyu.json -d start'
alias ss_stop='sudo ssserver -c ~/jiangzhenyu.json -d stop'" >> ~/.zshrc
source ~/.zshrc

# libsodium
cd
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
