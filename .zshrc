# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

CASE_SENSITIVE="true"

plugins=(archlinux docker github git golang ssh-agent vagrant)

source $ZSH/oh-my-zsh.sh

# User configuration

# Custom env
export EDITOR=vim
export TERMINAL=lxterminal
export JAVA_HOME=/usr/lib/jvm/java-8-jdk/
export FANTOM_HOME=$HOME/DEV/fantom_env/fantom
export GOROOT=$HOME/apps/go
export GOPATH=$HOME/DEV/go:$HOME/DEV/mesa/common/go:$HOME/DEV/mesa/mantle/go:$HOME/DEV/mesa/plume/go/:$HOME/DEV/mesa/seismic/go
export PATH="/home/tcolar/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/tcolar/apps/go/bin:/home/tcolar/DEV/fantom_env/fantom/bin:/home/tcolar/apps/go/bin:/home/tcolar/DEV/fantom_env/fantom/bin:/home/tcolar/DEV/go/bin/:/home/tcolar/DEV/scripts/"

# Aliases
alias vi=vim
alias reload=". ~/.zshrc && echo 'Reloaded .zshrc'"
alias ts="tig status"

# Docker
alias d=docker
alias dps="docker ps -a"
# Tail a docker container logs. Container name expected as an argument. 
dl() {
	docker ps -a | grep -m 1 "$* " | awk '{print $1}' | xargs docker logs -f
}
# Stop / # Drop all docker containers and unused images
dclean() {
	docker ps -a -q | xargs docker stop -t 3 
	docker ps -a -q | xargs docker rm -f
	docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi -f
}
