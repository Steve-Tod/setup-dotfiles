cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo "is_vim=\"ps -o state= -o comm= -t '#{pane_tty}' \
      | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'\"
bind-key -n C-h if-shell \"$is_vim\" \"send-keys C-h\"  \"select-pane -L\"
bind-key -n C-j if-shell \"$is_vim\" \"send-keys C-j\"  \"select-pane -D\"
bind-key -n C-k if-shell \"$is_vim\" \"send-keys C-k\"  \"select-pane -U\"
bind-key -n C-l if-shell \"$is_vim\" \"send-keys C-l\"  \"select-pane -R\"
bind-key -n C-\ if-shell \"$is_vim\" \"send-keys C-\\\" \"select-pane -l\"
bind-key -T copy-mode-vi C-h select-pane -L
bind-key -T copy-mode-vi C-j select-pane -D
bind-key -T copy-mode-vi C-k select-pane -U
bind-key -T copy-mode-vi C-l select-pane -R
bind-key -T copy-mode-vi C-\ select-pane -l" >> ~/.tmux.conf
