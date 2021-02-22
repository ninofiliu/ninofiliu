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

git-when () {
	date=$1
	git log --until=$date --max-count=1 --format=%h
}
	

git-time-travel () {
	date=$1
	commit=$(git-when $date)
	git reset --hard $commit
}

glb () {
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
