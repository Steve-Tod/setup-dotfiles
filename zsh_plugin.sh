git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sed -i "66i zsh-autosuggestions zsh-syntax-highlighting" ~/.zshrc
source ~/.zshrc
