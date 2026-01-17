#!/usr/bin/env zsh

setopt nobeep

# Enable timing reports
REPORTTIME=1

# Apply Settings
for settings in "$ZDOTDIR"/settings/*; do
	source "$settings"
done

# Launch Zellij
eval "$(zellij setup --generate-auto-start zsh)"
