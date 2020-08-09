export	EDITOR="vim"\
	VISUAL="vim"\
	LANGUAGE="en_US.UTF-8"\
	LC_ALL="en_US.UTF-8"\
	WINE_ARCH="wine32"\
	GPG_TTY=$(tty)\
	GOPATH="$HOME/.golang"\
	R_LIBS_USER="$HOME/.rlang"\\
	PATH="$HOME/.perl5/bin$:$HOME/.cargo/bin:$GOPATH/bin:$HOME/.local/bin:$HOME/.rvm/bin:/var/lib/snapd/snap/bin:$HOME/.npm-packages/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
