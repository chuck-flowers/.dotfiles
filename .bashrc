# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Include aliases if they exist
test -e "$HOME/.bash_aliases" && source ~/.bash_aliases

# Include bash functions if they exist
test -e "$HOME/.bash_functions" && source "$HOME/.bash_functions"

# Add bash completions
test -e /etc/bash_completion && source /etc/bash_completion
which himalaya > /dev/null && eval "$(himalaya completion bash)"

# Define the shell prompt
if which starship > /dev/null 2> /dev/null; then
	eval "$(starship init bash)"
else
	PS1='[\u@\h \W]\$ '
fi

# Define program defaults
export BROWSER=brave
export EDITOR=nvim

# Define Extend the path
PATH=~/.local/bin:$PATH

