git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#python -c "from utils import modify_zshrc; modify_zshrc(['git', 'zsh-autosuggestions', 'zsh-syntax-highlighting'])"
mv ../dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
