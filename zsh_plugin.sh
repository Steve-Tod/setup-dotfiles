git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
python -c "from utils import modify_zshrc; modify_zshrc(['git', 'zsh-autosuggestions', 'zsh-syntax-highlighting'])"
source ~/.zshrc
