## /etc/zsh/zshrc - ZSH SHELL CONFIG GLOBAL

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/splatrat/.local/bin/pintos:/home/splatrat/.local/bin"
export LANG=en_GB.UTF-8
setopt appendhistory autocd nomatch notify nohashdirs
unsetopt beep extendedglob
bindkey -e
setopt HIST_IGNORE_DUPS

#    zstyle :compinstall filename '$HOME/.zshrc'
HISTFILE=$HOME/.histfile
HISTSIZE=10000
SAVEHIST=10000

export ZSHRC=/etc/zsh/zsh.d
export ZSH=$ZSHRC/oh-my-zsh

DISABLE_AUTO_UPDATE="true"
ZSH_THEME="bullet-train"
source $ZSHRC/btconf.zsh

plugins=(git)

export LANG=en_GB.UTF-8

setopt appendhistory autocd nomatch notify nohashdirs
unsetopt beep extendedglob
bindkey -e
setopt HIST_IGNORE_DUPS

source $ZSH/oh-my-zsh.sh
export TERMINFO=$HOME/.terminfo
# zstyle :compinstall filename $HOME/.zshrc

autoload -Uz compinit
autoload -Uz promptinit
compinit
promptinit

export TERM=xterm-256color
export EDITOR=emacs

for file in $ZSHRC/*.zsh
do
    source $file
done

source $HOME/.aliases

# Make sure the terminal is in application mode, when zle is active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' ${terminfo[smkx]}
    }
    function zle-line-finish () {
        printf '%s' ${terminfo[rmkx]}
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi 

