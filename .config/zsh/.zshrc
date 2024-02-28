# Configure history behavior
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Completion
autoload -U compinit
compinit
zstyle ':completion:*' menu select

# Prompt
export PROMPT="[%F{yellow}%n%f@%m %1d] $ "

