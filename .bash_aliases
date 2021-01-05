alias case-camel-kebab="sed -r -e 's/([A-Z])/-\L\1/g'"
alias cc="xclip -selection clipboard"
alias cu="chromium --disable-web-security --user-data-dir=$HOME/chromium-unsafe"
alias cv="xclip -selection clipboard -out"
alias dog="highlight -O ansi"
alias g="git log --oneline -n 5 && git status --short"
alias gb="git branch -vv"
alias gl="git log --oneline"
alias glm="git log --oneline origin/master.."
alias ll="ls -ahl"
alias ll="ls -alh"
alias x="xdg-open"

function git-time-travel () {
	date=$1
	commit=$(git log --since=$date -n=1 --format=format:%h)
	git reset --hard $commit
}

function glb () {
	local branches=$(git branch | grep -v '^*' | colrm 1 2)
	local file=$(mktemp)
	rm $file
	touch $file
	for branch in $branches
	do
		nb_commits=$(git rev-list --count $branch..)
		echo $nb_commits,$branch >> $file
	done
	local base=$(cat $file | sort -n | head -n 1 | cut -d ',' -f 2)
	rm $file
	git log --oneline $base..
	echo "($base)"
}
