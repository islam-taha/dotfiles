## please share history between sessions ##
setopt inc_append_history
setopt incappendhistory
setopt share_history
setopt sharehistory
## end ##
## tmux ##
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'' ])'
export ZSH_TMUX_AUTOSTART=true
export TERM="xterm-256color"
## end ##

## lazy load nvm ##
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true
export ALIEN_THEME="green"
## nvm end ##

## load rbenv ##
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}
## end ##
## openssl ##
export PATH="/usr/local/opt/openssl/bin:$PATH"
## end ##

# zsh options
setopt auto_cd

## begin antigen ##
source ~/antigen.zsh

antigen use oh-my-zsh
# antigen theme miloshadzic
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

source ~/powerline9k.sh
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

export NVM_DIR=$(cd ~/.nvm && pwd -P)
## end exports ##

## nvm init
#. "/usr/local/opt/nvm/nvm.sh"

## begin aliases ##
alias run='g++ -std=c++11 -DDEBUG -O2'
alias js="git status"
alias jl="git pull upstream master"
alias jc="git checkout -b"
alias jp="git push"
alias ja="git checkout -- "
alias jd="git add"
alias jo="git commit -m "
alias jg="git checkout "
alias merge="git merge master"
alias jgm="git checkout master"
alias pd=‘bundle exec cap production deploy && bundle exec cap production puma:restart’
alias sd=‘bundle exec cap staging deploy && bundle exec cap staging puma:restart’
## end aliases ##
