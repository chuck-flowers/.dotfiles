#!/usr/bin/env zsh

function apply_settings() {
	source "$ZDOTDIR/settings/$1"
}

setopt nobeep

# History
apply_settings 'aliases'
apply_settings 'completion'
apply_settings 'history'
apply_settings 'prompt'

