# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# GIT prompt
source ~/.zsh/git-prompt/zshrc.sh
PROMPT='%B%m%~%b$(git_super_status) %# '

# Custom env
export FANTOM_HOME=$HOME/DEV/fantom_env/fantom
export GOROOT=$HOME/apps/go
export GOPATH=$HOME/DEV/go:$HOME/DEV/mesa/common/go:$HOME/DEV/mesa/mantle/go:$HOME/DEV/mesa/plume/go/:$HOME/DEV/mesa/seismic/go
export PATH=$PATH:$GOROOT/bin:$FANTOM_HOME/bin:$HOME/DEV/go/bin/:~/DEV/scripts/
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export DOCKER_HOST="tcp://127.0.0.1:2375"
export EDITOR=vim
EXPORT TERMINAL=lxterminal

alias vi=vim

eval `gnome-keyring-daemon --start`
eval `ssh-agent`
