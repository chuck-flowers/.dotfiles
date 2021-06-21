# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Include aliases if they exist
test -e "$HOME/.bash_aliases" && source ~/.bash_aliases

# Add bash completions
test -e /etc/bash_completion && source /etc/bash_completion

# Define the shell prompt
PS1='[\u@\h \W]\$ '

