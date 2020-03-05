cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

cd -
cat tmux_navigator_str.txt >> ~/.tmux.conf
