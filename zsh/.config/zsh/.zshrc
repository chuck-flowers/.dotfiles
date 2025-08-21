#!/usr/bin/env zsh

setopt nobeep

# Enable timing reports
REPORTTIME=1

# Apply Settings
for settings in "$ZDOTDIR"/settings/*; do
	source "$settings"
done

# Enable FZF integration
command -v fzf >& /dev/null && source <(fzf --zsh)

# Launch Zellij
ZELLIJ_AUTO_EXIT=true eval "$(zellij setup --generate-auto-start zsh)"
