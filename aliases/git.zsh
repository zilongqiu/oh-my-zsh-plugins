# Aliases

alias st='git status'
alias br='git branch'
alias co='git checkout'
alias add='git add -p'
alias cob='git checkout -b'
alias reset='git reset HEAD --hard'
alias back='git reset HEAD~1'
alias push='git push origin $(git_current_branch)'
alias pull='git pull origin $(git_current_branch)'
alias commit='git commit -m'
alias clean='git clean -fd'
alias diff='git diff'
alias logs='git log --oneline --decorate'
alias remoteset='git remote set-url'
alias remote='git remote -v'

###
# Delete branch on local and remote
#
# prune test
###
prune() {

    if [ "$1" = "" ]; then echo "'prune' requires a branch name"; return; fi
    git branch -D "$1" && git push origin --delete "$1"

}

###
# `gitit` -- open your current folder, on your current branch, in GitHub.
# `gitit <folder or file>` -- open that folder in your current branch (paths are relative).
#
# Available first arguments: compare, commits, history, branch, branches, pulls, issues, grep, ctrlp, repo, help
#
# usage examples :
#
# gitit
###
gitit() {
    gitit_command="$1"

    if [ $# -eq 0 ]; then git_open_file
    elif [ $gitit_command = "compare" ]; then git_open_compare $2
    elif [ $gitit_command = "commits" ]; then git_open_commits $2
    elif [ $gitit_command = "history" ]; then git_open_history $2 $3
    elif [ $gitit_command = "branch" ]; then git_open_branch $2
    elif [ $gitit_command = "branches" ]; then git_branches $2
    elif [ $gitit_command = "pulls" ]; then git_open_pulls $@
    elif [ $gitit_command = "issues" ]; then git_open_issues $@
    elif [ $gitit_command = "grep" ]; then git_grep $@
    elif [ $gitit_command = "ctrlp" ]; then git_ctrlp $2
    elif [ $gitit_command = "repo" ]; then git_open_repo $2 $3
    else git_open_file $1 $2
    fi
}
