cp .vimrc ~/.vimrc \
  && echo "Updated .vimrc"

cp .gitconfig ~/.gitconfig \
  && echo "Updated .gitconfig"

cp .tmux.conf ~/.tmux.conf \
  && echo "Updated .tmux.conf"

mkdir -p ~/.config/git \
  && echo "*.swp" >> ~/.config/git/ignore \
  && echo "Updated global .gitignore"
