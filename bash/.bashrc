#!/usr/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set Environment Variables
source "$HOME/.config/bash/variables"

# Include aliases if they exist
test -e "$HOME/.config/bash/aliases" && source "$HOME/.config/bash/aliases" 

# Include bash functions if they exist
test -e "$HOME/.config/bash/functions" && source "$HOME/.config/bash/functions"

# Include rust in the environment if it exists
test -e "$HOME/.cargo/env" && source "$HOME/.cargo/env"

# Add bash completions
test -e /etc/bash_completion && source /etc/bash_completion
command -v himalaya > /dev/null 2> /dev/null && eval "$(himalaya completion bash)"
command -v gh > /dev/null 2> /dev/null && eval "$(gh completion)"

# Define the shell prompt
if command -v starship > /dev/null 2> /dev/null; then
	eval "$(starship init bash)"
else
	PS1='[\u@\h \W]\$ '
fi

# Configures nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Define the default browser
if command -v wsl-open > /dev/null 2>&1; then
	export BROWSER=wsl-open
else
	export BROWSER=brave
fi

export EDITOR=nvim

