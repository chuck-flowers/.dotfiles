#!/usr/bin/env zsh

function apply_settings() {
	source "$ZDOTDIR/settings/$1"
}

setopt nobeep

REPORTTIME=1

# History
apply_settings 'aliases'
apply_settings 'completion'
apply_settings 'history'
apply_settings 'prompt'

