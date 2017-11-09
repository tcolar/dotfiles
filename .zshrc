
# oh-my-zsh
export ZSH=/Users/tcolar/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git docker github golang ssh-agent)
source $ZSH/oh-my-zsh.sh

# PATH
export PATH=~/go/bin:./node_modules/.bin/:~/code/ops/.tools/:$PATH
export NVM_DIR="$HOME/.nvm"
. "$HOME/.nvm/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Env
export PGHOST=localhost
export PGPORT=5432

## gitcd /tm
alias gp="git pull"
alias gf="git fetch"
alias gpod="git pull origin develop"
alias gpom="git pull origin master"
alias gfod="git fetch origin develop"
alias gfom="git fetch origin master"
alias grod="git rebase -i origin/develop"
alias grom="git rebase -i origin/master"
alias gpush="git push origin HEAD"
alias gpushf="git push -f origin HEAD"

## docker
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

# Apps
alias vi=vim
alias ts="tig status"
alias meld="/Applications/Meld.app/Contents/MacOS/Meld"

# open
alias o="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
# find file
function f() {
	find . -name "*$@*"
}
# search file
function s() {
	grep -rni "$@" .
}

