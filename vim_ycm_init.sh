# vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ./.vimrc ~/.vimrc
vim +PluginInstall +qall

# ycm
python -c "from utils import search_package_and_install; search_package_and_install(['build-essential', 'cmake', 'python-dev', 'python3-dev'])"
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer

cp .ycm_extra_conf.py ~/.vim/

cd -
