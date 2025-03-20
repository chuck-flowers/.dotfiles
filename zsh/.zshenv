#!/usr/bin/env zsh

# ZSH Configuration
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
fpath=($HOME/.local/share/zsh/site-functions/ $fpath)

# Custom Executables
if test -d "$HOME/.local/bin"; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# Go Executables
if test -d "$HOME/go/bin"; then
	export PATH="$HOME/go/bin:$PATH"
fi

# Kubernetes Kubectl Plugins
if test -d "$HOME/.krew/bin"; then
	export PATH="$HOME/.krew/bin:$PATH"
fi

# NVM Executables
if test -d "$HOME/.nvm"; then
	source "$HOME/.nvm/nvm.sh"
fi

# PNPM Executables
export PNPM_HOME="$HOME/.local/share/pnpm"
if test -d "$PNPM_HOME"; then
	export PATH="$PNPM_HOME:$PATH"
fi

# Rust Executables
if test -d "$HOME/.cargo/bin"; then
	export PATH="$HOME/.cargo/bin:$PATH";
fi

# Default Browser
if command -v wsl-open >& /dev/null; then
	export BROWSER=wsl-open
else
	export BROWSER=brave
fi

# Default Editor
export EDITOR=nvim

