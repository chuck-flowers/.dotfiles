export ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config/zsh}

export EDITOR=nvim

# Custom Executables
if test -d "$HOME/.local/bin"; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# NVM configuration
[ -s "$HOME/.nvm" ] && source "$HOME/.nvm/nvm.sh"

