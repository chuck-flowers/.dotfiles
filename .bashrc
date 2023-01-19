#!/usr/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Define Extend the path
PATH=~/.local/bin:$PATH

# Include aliases if they exist
test -e "./.bash_aliases" && source "./.bash_aliases"

# Include bash functions if they exist
test -e "./.bash_functions" && source "./.bash_functions"

# Include rust in the environment if it exists
test -e "./.cargo/env" && source "./.cargo/env"

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

