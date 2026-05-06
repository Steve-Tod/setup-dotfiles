# configs_and_settings

Install the main zsh, vim, and tmux configuration in one pass:

```sh
bash scripts/setup.sh
```

The setup script requires zsh to be installed first. It installs oh-my-zsh
without switching shells, installs the custom zsh plugins, installs fzf with
Homebrew when available, copies the dotfiles, runs Vundle's Vim plugin install,
copies the tmux configuration, and tries to make zsh the default shell. Restart
the shell afterwards, or run `exec zsh`.

You can also run a single stage:

```sh
bash scripts/setup.sh zsh
bash scripts/setup.sh fzf
bash scripts/setup.sh vim
bash scripts/setup.sh tmux
```
