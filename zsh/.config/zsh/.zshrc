#!/usr/bin/env zsh

function apply_settings() {
	source "$ZDOTDIR/settings/$1"
}

setopt nobeep

# Enable timing reports
REPORTTIME=1

apply_settings 'aliases'
apply_settings 'completion'
apply_settings 'history'
apply_settings 'prompt'


# Enable FZF integration
command -v fzf >& /dev/null && source <(fzf --zsh)

# Launch Zellij
ZELLIJ_AUTO_EXIT=true eval "$(zellij setup --generate-auto-start zsh)"
