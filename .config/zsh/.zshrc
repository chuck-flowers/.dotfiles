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

# Enable vi mode 
bindkey -v

