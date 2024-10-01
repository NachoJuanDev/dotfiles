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

#@dtemp#:Create a random folder temp and move to it
function dtemp {
	cd $(mktemp -d)
}

# @fh#:Interactive history search
function fh() {
    local selected_command
    selected_command=$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
    
    if [[ -n $selected_command ]]; then
        print -z "$selected_command"
    fi
}