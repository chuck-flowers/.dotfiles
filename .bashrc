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
if command -v himalaya > /dev/null 2> /dev/null; then
	eval "$(himalaya completion bash)"
fi

# Define the shell prompt
if command -v starship > /dev/null 2> /dev/null; then
	eval "$(starship init bash)"
else
	PS1='[\u@\h \W]\$ '
fi

# Define program defaults
export BROWSER=brave
export EDITOR=nvim

