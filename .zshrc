# oh-my-zsh
export ZSH="/Users/tcolar/.oh-my-zsh"
ZSH_THEME="tcolar" #"robbyrussell"
plugins=(zsh-autosuggestions git aws docker git-remote-branch go history nvm node npm postgres redis-cli sudo tig vscode yarn)
source $ZSH/oh-my-zsh.sh

# SECRETS
source ~/secrets.sh

# PATH
export PATH=~/go/bin:~/bin:./node_modules/.bin/:~/code/ops/.tools/:$PATH
export NVM_DIR="$HOME/.nvm"

# Env
export PGHOST=localhost
export PGPORT=5432

## git
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

# call nvm use automatically whenever you enter a directory that contains an .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
 if [[ -f .nvmrc && -r .nvmrc ]]; then
   nvm use >/dev/null
 elif [[ $(nvm version) != $(nvm version default)  ]]; then
   nvm use default >/dev/null
 fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc 

setopt NO_cdable_vars

# env
export AWS_REGION='us-west-2'
export AWS_DEFAULT_REGION='us-west-2'

alias cbox-local='$HOME/code/convoy/convoy-box/cbox/bin/cbox-local'

# speed up new shells ??
# rm -rf /var/log/asl/*.asl
