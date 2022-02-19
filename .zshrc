export ZSH="$HOME/.oh-my-zsh"

# history
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt INC_APPEND_HISTORY
setopt inc_append_history
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS


ZSH_THEME="gentoo"
DISABLE_UPDATE_PROMPT="true"

export NVM_LAZY_LOAD=true
plugins=(git command-not-found fzf zsh-syntax-highlighting zsh-autosuggestions copydir copyfile zsh-nvm)

# zsh-syntax-highlighting
source $ZSH/oh-my-zsh.sh
ZSH_HIGHLIGHT_STYLES[globbing]='none'

# fzf
if [[ $OSTYPE == 'darwin'* ]]; then
  export FZF_BASE=$(brew --prefix)/opt/fzf/install
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# covered by zsh-nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias nv="nvim"
alias hidegit="git config --add oh-my-zsh.hide-status 1 && git config --add oh-my-zsh.hide-dirty 1"
