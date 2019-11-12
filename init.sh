sudo rm /etc/update-motd.d/
sudo apt-get --assume-yes install screenfetch > /dev/null \
  && sudo cp 01-custom /etc/update-motd.d/ \
  && sudo chmod +x /etc/update-motd.d/01-custom \
  && echo "Successfully updated motd"

cp .vimrc ~/.vimrc \
  && echo "Updated .vimrc"

cp .gitconfig ~/.gitconfig \
  && echo "Updated .gitconfig"

cp .tmux.conf ~/.tmux.conf \
  && echo "Updated .tmux.conf"

sudo apt-get --assume-yes install zsh > /dev/null \
  && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
  && cp .zshrc ~/.zshrc \
  && echo "Downloaded and setup zsh"

mkdir -p ~/.config/git \
  && echo "*.swp" > ~/.config/git/ignore \
  && echo "Updated global .gitignore"
