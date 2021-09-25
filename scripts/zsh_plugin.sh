git clone https://github.com:zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
python -c "from utils import modify_zshrc; modify_zshrc(['git', 'zsh-autosuggestions', 'zsh-syntax-highlighting'])"
source ~/.zshrc
