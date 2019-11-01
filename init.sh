rm /etc/update-motd.d/* 
apt-get --assume-yes install screenfetch > /dev/null \
  && cp 01-custom /etc/update-motd.d/ \
  && chmod +x /etc/update-motd.d/01-custom \
  && echo "Successfully updated motd"

cp .vimrc ~/.vimrc \
  && echo "Updated .vimrc"

cp .gitconfig ~/.gitconfig \
  && echo "Updated .gitconfig"

cp .tmux.conf ~/.tmux.conf \
  && echo "Updated .tmux.conf"

