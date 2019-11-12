export ZSH="/home/robert/.oh-my-zsh"

ZSH_THEME="gentoo"

DISABLE_UPDATE_PROMPT="true"

plugins=(git docker npm command-not-found)

source $ZSH/oh-my-zsh.sh

alias reset="docker-compose up -d --build"
