[ -z "$PS1" ] && return

shopt -s checkwinsize histappend direxpand extglob
export HISTSIZE=50000

function extract() {
	if [[ -f "$1" ]]; then
		case "$1" in
			*.tar.bz2)	tar xvjf "$1"	;;
			*.tbz2)		tar xvjf "$1"	;;
			*.bz2)		tar xvjf "$1"	;;
			*.tar.gz)	tar xvzf "$1"	;;
			*.tgz)		tar xvzf "$1"	;;
			*.gz)		tar xvzf "$1"	;;
			*.tar)		tar xvf "$1"	;;
			*.rar)		unrar x "$1"	;;
			*.zip)		unzip "$1"	;;
			*.7z)		7z x "$1"	;;
			*.Z)		uncompress "$1"	;;
			*)	echo "'$1' cannot be extracted via extract()";;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}

function maketar() {
	tar cvzf "${1%%/}.tar.gz" "${1%%/}/";
}

function makezip() {
	zip -r "${1%%/}.zip" "$1";
}

function spider() {
	wget -r -l 2 -e robots=off -nd -A "$2" "$1"
}

function ix() {
	local opts
	local OPTIND

	[[ -f "$HOME/.netrc" ]] && opts='-n'

	while getopts ":hd:i:n:" x; do
		case $x in
			h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
			d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
			i) opts="$opts -X PUT"; local id="$OPTARG";;
			n) opts="$opts -F read:1=$OPTARG";;
		esac
	done

	shift $(($OPTIND - 1))

	if [[ -t 0 ]]; then
		local filename="$1"
		shift

		if [[ -f "$filename" ]]; then
			curl $opts -F f:1=@"$filename" $* ix.io/$id
			return
		fi

		echo "^C to cancel, ^D to send."
	fi

	curl $opts -F f:1='<-' $* ix.io/$id
}

alias ls="ls --color=auto"
alias ll="ls --color=auto -hal"
alias tree="tree -C"
alias glog="git log --oneline"

PS1='\W '
PS2='| '

if [ "$TERM" = "dumb" ]; then
	PS1='$'
elif [ -n "$SSH_CONNECTION" ]; then
	PS1="\u@\h:$PS1";
elif [ $USER != 'atak' ]; then
	PS1="\u:$PS1";
fi
