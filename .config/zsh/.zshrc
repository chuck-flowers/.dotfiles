# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Completion
autoload -U compinit
compinit
zstyle ':completion:*' menu select

source "$ZDOTDIR/aliases"
source "$ZDOTDIR/prompt"
