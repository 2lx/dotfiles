export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
# ZSH_THEME="my_theme"

DISABLE_UPDATE_PROMPT="true"
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

ZSH_TMUX_AUTOCONNECT="true"
ZSH_TMUX_AUTOQUIT="false"

plugins=(tmux chucknorris encode64)
source $ZSH/oh-my-zsh.sh

# User configuration
# export LANG=en_US.UTF-8
# export PATH=$PATH:$HOME/.vim/plugged/vim-live-latex-preview/bin
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# disable ^s ^q
stty -ixon
# disable ^d in terminator
set -o ignoreeof

# stty erase '^?'

# if $USER == $DEFAULT_USER then hide user:host names in prompt
export DEFAULT_USER=$(whoami)

source ~/.zshrc_aliases
source ~/.zshrc_fg_shortcut

# export GPG_TTY=$(tty)
# if [[ -n "$SSH_CONNECTION" ]] ;then
# export PINENTRY_USER_DATA="USE_CURSES=1"
# fi

# greetings
# fortune -s | cowsay -f default
# curl wttr.in/Mycity
chuck_cow

