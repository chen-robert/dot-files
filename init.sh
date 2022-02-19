#!/bin/sh

set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update && \
  apt-get install -qy git curl zsh tmux software-properties-common ripgrep

add-apt-repository -y ppa:neovim-ppa/stable
apt-get update
apt-get install -qy neovim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

BACKUP_DIR=~/.dot-file-bk
backup () {
  TARGET=$BACKUP_DIR/$1
  mkdir -p $(dirname $TARGET)
  if [ -e ~/$1 ]; then
    cp ~/$1 $BACKUP_DIR/$1
  fi
}

backup .vimrc
backup .zshrc
backup .gitconfig
backup .tmux.conf
backup .config/git/ignore

cp .vimrc ~/.vimrc \
  && echo "Updated .vimrc"
cp .zshrc ~/.zshrc \
  && echo "Updated .zshrc"
cp .gitconfig ~/.gitconfig \
  && echo "Updated .gitconfig"
cp .tmux.conf ~/.tmux.conf \
  && echo "Updated .tmux.conf"

mkdir -p ~/.config/git \
  && echo "*.swp" >> ~/.config/git/ignore \
  && echo "Updated global .gitignore"

mkdir -p ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

# https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +'PlugInstall --sync' +qa
NVIM_PLUGIN_INSTALLING=true nvim +'PlugInstall --sync' +qa

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all --no-zsh --no-bash --no-fish
