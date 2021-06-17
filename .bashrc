# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Include aliases if they exist
test -e "$HOME/.bash_aliases" && source ~/.bash_aliases

# Define the shell prompt
PS1='[\u@\h \W]\$ '

