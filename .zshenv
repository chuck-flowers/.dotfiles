export ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config/zsh}

export EDITOR=nvim

# Browser
if command -v wsl-open -v > /dev/null 2>&1; then
	export BROWSER=wsl-open
else
	export BROWSER=brave
fi

# Custom Executables
if test -d "$HOME/.local/bin"; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# NVM configuration
[ -s "$HOME/.nvm" ] && source "$HOME/.nvm/nvm.sh"

