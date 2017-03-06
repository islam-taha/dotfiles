## begin zstyle ##
#
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
#
## end zstyle ##

## lazy load nvm ##
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true
## nvm end ##

# zsh options
setopt auto_cd

## begin antigen ##
source ~/antigen.zsh

antigen use oh-my-zsh
antigen theme lambda-mod
#
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions --branch=develop
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle hlissner/zsh-autopair
antigen bundle rupa/z
antigen bundle lukechilds/zsh-nvm
#
antigen bundle command-not-found
antigen bundle git
antigen bundle heroku
#
antigen apply
## end antigen ##

## start keybindings ##
#
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
## end keybindings ##

## begin exports ##
export PATH="/Users/Tensor/.rbenv/shims:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export ARCHFLAGS="-arch x86_64"

export RAILS_ENV=development
export PORT=5000

export NVM_DIR="$HOME/.nvm"
## end exports ##

## nvm init
. "/usr/local/opt/nvm/nvm.sh"

## begin aliases ##
alias run='g++ -std=c++11 -DDEBUG -O2'
alias js="git st"
alias jl="git pull upstream master"
alias jc="git cb"
alias jp="git push"
alias ja="git checkout -- "
alias jd="git add"
alias jo="git cm "
alias jg="git checkout "
alias merge="git merge master"
alias jgm="git checkout master"
## end aliases ##
