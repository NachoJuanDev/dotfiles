#> Scripts <#

#@g-clean-branch#:Clean merged branch
function g-clean-branch() {
	git branch --merged |
		egrep -v "(^\*|live|production|main|master|dev|develop|development)" |
		xargs git branch -d
}

#@rZsh#:Reset zsh
function rZsh {
	source ~/.zshrc
}

#@dtemp#:Create a random folder temp and move it
function dtemp {
	cd $(mktemp -d)
}
