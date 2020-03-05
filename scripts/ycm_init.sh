# ycm
# need build-essential cmake python-dev python3-dev
# python -c "from utils import search_package_and_install; search_package_and_install(['build-essential', 'cmake', 'python-dev', 'python3-dev'])"
sed -E 's/" Plugin(.*YouCompleteMe.*$)/Plugin\1/g' ~/.vimrc > ~/.vimrc
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
cp ../dotfiles/.ycm_extra_conf.py ~/.vim/
cd -
cat ycm_vim_conf_str.txt >> ~/.vimrc
