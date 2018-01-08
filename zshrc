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

## don't use powerline9k inside emacs ##
if [ -n "$INSIDE_EMACS" ]; then
  antigen theme miloshadzic
else
  # antigen theme miloshadzic
  source ~/powerline9k.sh
fi

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

## setup default nvm alias if inside vim
if [ -n "$VIMRUNTIME" ]; then
  nvm alias default 6.10.2
fi

## begin aliases ##
alias run='g++ -std=c++11 -DDEBUG -O2'
alias js="git status"
alias jl="git pull origin $(git rev-parse --abbrev-ref HEAD)"
alias jc="git checkout -b"
alias jp="git push"
alias ja="git checkout -- "
alias jd="git add"
alias jo="git commit -m "
alias jg="git checkout "
alias jm="git merge --no-ff"
alias jgd="git checkout develop"
alias jgs="git checkout staging"
alias merge="git merge master"
alias jgm="git checkout master"
alias pd="bundle exec cap production deploy && bundle exec cap staging puma:stop && bundle exec cap staging puma:start"
alias sd="bundle exec cap staging deploy && bundle exec cap staging puma:stop && bundle exec cap staging puma:start"
alias be="bundle exec"
## end aliases ##

## begin custom scrips ##
source ~/.sup_env
## end ##

## begin ionic android ##
# Create a JAVA_HOME variable, determined dynamically
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=${JAVA_HOME}/bin:$PATH
export ANDROID_HOME=~/Library/Android/sdk/
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export GRADLE_HOME=/Library/gradle/gradle-3.2
export PATH=$PATH:$GRADLE_HOME/bin
## end ##

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'
