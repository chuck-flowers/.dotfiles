export ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config/zsh}

# NVM configuration
[ -s "$HOME/.nvm" ] && source "$HOME/.nvm/nvm.sh"

# PNPM
export PNPM_HOME="/home/cflowers/.local/share/pnpm"
case ":$PATH:" in
	*":$PNPM_HOME:"*) ;;
	*) export PATH="$PNPM_HOME:$PATH" ;;
esac

export EDITOR=nvim

# Browser
if command -v wsl-open >& /dev/null; then
	export BROWSER=wsl-open
else
	export BROWSER=brave
fi

# Custom Executables
if test -d "$HOME/.local/bin"; then
	export PATH="$HOME/.local/bin:$PATH"
fi

