# Funcion to format a markdown file
# Output to other file:
# md_format input-file [output-file]
# Output to stdout
# md_format input-file --
# Write back to file:
# md_format input-file
function md_format() {
	OUT=$( (
		head -n $(grep -n "^\.\.\.$" $1 | cut -d : -f 1) $1
		echo
		pandoc -f markdown -t markdown-simple_tables --atx-headers --wrap=auto --columns=120 $1
	) | cat)
	if [ $# -eq 1 ]; then
		echo -E $OUT | cat >$1
	elif [ $# -eq 2 ]; then
		if [ "--" = "$2" ]; then
			echo -E $OUT
		else
			echo -E $OUT | cat >$2
		fi
	fi
}

# Calculator
# c [calculation]
c() {
	printf "%s\n" "$*" | bc
}
alias c="noglob c"

function unarchive() {
	if [ -f $1 ]; then
		case $1 in
		*.tar.bz2)
			tar xvjf $1
			;;
		*.tar.gz)
			tar xvzf $1
			;;
		*.tar.xz)
			tar xvf $1
			;;
		*.bz2)
			bunzip2 $1
			;;
		*.rar)
			unrar x $1
			;;
		*.gz)
			gunzip $1
			;;
		*.tar)
			tar xvf $1
			;;
		*.tbz2)
			tar xvjf $1
			;;
		*.tgz)
			tar xvzf $1
			;;
		*.zip)
			unzip $1
			;;
		*.Z)
			uncompress $1
			;;
		*.7z)
			7z x $1
			;;
		*.apk)
			unzip $1
			;;
		*)
			echo "'$1' cannot be extracted via unarchive"
			;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
