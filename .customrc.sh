#!/bin/sh

#exports
export VISUAL=vim
export EDITOR="$VISUAL"
export AWS_REGION='us-west-2'
export AWS_DEFAULT_REGION='us-west-2'

# aliases
alias gc="git checkout"
alias gf="git fetch"
alias gp="git pull"
alias gpod="git pull origin develop"
alias gpom="git pull origin master"
alias gfod="git fetch origin develop"
alias gfom="git fetch origin master"
alias grod="git rebase -i origin/develop"
alias grom="git rebase -i origin/master"
alias gpush="git push origin HEAD"
alias gpushf="git push -f origin HEAD"

alias k="kubectl"

alias d=docker
alias dps="docker ps -a"

alias o=code

# Apps
alias vi=vim
alias ts="tig status"

# functions

# Stop / # Drop all docker containers and unused images
dclean() {
	docker ps -a -q | xargs docker stop -t 3
	docker ps -a -q | xargs docker rm -f
	docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi -f
}

# find file
function f() {
	find . -name "*$@*"
}
# search file
function s() {
	grep -rni "$@" .
}
