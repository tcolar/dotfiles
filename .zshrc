# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(archlinux docker github git golang ssh-agent vagrant)

source $ZSH/oh-my-zsh.sh

# User configuration

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Custom env
export FANTOM_HOME=$HOME/DEV/fantom_env/fantom
export GOROOT=$HOME/apps/go
export GOPATH=$HOME/DEV/go:$HOME/DEV/mesa/common/go:$HOME/DEV/mesa/mantle/go:$HOME/DEV/mesa/plume/go/:$HOME/DEV/mesa/seismic/go
export PATH="/home/tcolar/perl5/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/core_perl:/home/tcolar/apps/go/bin:/home/tcolar/DEV/fantom_env/fantom/bin:/home/tcolar/apps/go/bin:/home/tcolar/DEV/fantom_env/fantom/bin:/home/tcolar/DEV/go/bin/:/home/tcolar/DEV/scripts/"

export JAVA_HOME=/usr/lib/jvm/java-8-jdk/
export DOCKER_HOST="tcp://127.0.0.1:2375"
export EDITOR=vim
export TERMINAL=lxterminal

alias vi=vim
alias d=docker
alias reload=". ~/.zshrc && echo 'Reloaded .zshrc'"
alias d=docker
alias dps="docker ps -a"
# Tail a docker container logs. Container name expected as an argument. 
dl() {
	docker ps -a | grep -m 1 "$* " | awk '{print $1}' | xargs docker logs -f
}
