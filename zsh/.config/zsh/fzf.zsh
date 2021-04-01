# This file contains functions using fzf
# They were mostly taken from: https://github.com/junegunn/fzf/wiki/Examples

# --------------------
# Git stuff
# --------------------

# fbr - checkout git branch (including remote branches)
fbr() {
	local branches branch
	branches=$(git branch --all | grep -v HEAD) &&
		branch=$(echo "$branches" |
			fzf-tmux -d $((2 + $(wc -l <<<"$branches"))) +m) &&
		git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
fco() {
	local tags branches target
	branches=$(
		git --no-pager branch --all \
			--format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" |
			sed '/^$/d'
	) || return
	tags=$(
		git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}'
	) || return
	target=$(
		(
			echo "$branches"
			echo "$tags"
		) |
			fzf --no-hscroll --no-multi -n 2 \
				--ansi
	) || return
	git checkout $(awk '{print $2}' <<<"$target")
}

# fcoc - checkout git commit
fcoc() {
	local commits commit
	commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
		commit=$(echo "$commits" | fzf --tac +s +m -e) &&
		git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow - git commit browser
fshow() {
	git log --graph --color=always \
		--format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
		fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
			--bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
	local out q k sha
	while out=$(
		git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
			fzf --ansi --no-sort --query="$q" --print-query \
				--expect=ctrl-d,ctrl-b
	); do
		mapfile -t out <<<"$out"
		q="${out[0]}"
		k="${out[1]}"
		sha="${out[-1]}"
		sha="${sha%% *}"
		[[ -z "$sha" ]] && continue
		if [[ "$k" == 'ctrl-d' ]]; then
			git diff $sha
		elif [[ "$k" == 'ctrl-b' ]]; then
			git stash branch "stash-$sha" $sha
			break
		else
			git stash show -p $sha
		fi
	done
}

# --------------------
# Docker Stuff
# --------------------

# Select a docker container to remove
function drm() {
	docker ps -a | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs -r docker rm
}

function drmi() {
	docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
}

function drmif() {
	docker images | sed 1d | fzf -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi --force
}

# --------------------
# Man Pages
# --------------------

# Find man pages
function fman() {
	man -k . | fzf -q "$1" --prompt='man> ' --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}

# --------------------
# Pacman
# --------------------
function in() {
	paru -Slq | fzf -q "$1" -m --reverse --preview 'paru -Si {1}; echo Comments:; paru -Gc {1}' --preview-window='right:50%:wrap' | xargs -ro paru -S
}

function ind() {
	paru -Slq | fzf -q "$1" -m --reverse --preview 'paru -Si {1}; echo Comments:; paru -Gc {1}' --preview-window='right:50%:wrap' | xargs -ro paru -S --asdeps
}

function re() {
	paru -Qq | fzf -q "$1" -m --reverse --preview 'paru -Qi {1}; echo Comments:; paru -Gc {1}' | xargs -ro paru -Rns
}
