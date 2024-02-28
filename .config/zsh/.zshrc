# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Completion
autoload -U compinit
compinit
zstyle ':completion:*' menu select

source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases"
source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/prompt"

