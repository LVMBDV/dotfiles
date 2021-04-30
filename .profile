export	EDITOR="vim"\
	VISUAL="vim"\
	LANGUAGE="en_US.UTF-8"\
	LC_ALL="en_US.UTF-8"\
	WINE_ARCH="wine32"\
	GPG_TTY=$(tty)\
	GOPATH="$HOME/.golang"\
	R_LIBS_USER="$HOME/.rlang"\
	PATH="$HOME/.perl5/bin$:$HOME/.cargo/bin:$GOPATH/bin:$HOME/.local/bin:$HOME/.rvm/bin:/var/lib/snapd/snap/bin:$HOME/.npm-packages/bin:$HOME/.config/composer/vendor/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"
[[ -s "$HOME/.fzf.bash" ]] && source "$HOME/.fzf.bash"
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
[[ -s "$HOME/.nvm/bash_completion" ]] && source "$HOME/.nvm/bash_completion"
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
