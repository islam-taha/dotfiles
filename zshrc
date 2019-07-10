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
# rbenv() {
#   eval "$(command rbenv init -)"
#   rbenv "$@"
# }
## end ##
## openssl ##
export PATH="/usr/local/opt/openssl/bin:$PATH"
## end ##

# zsh options
setopt auto_cd

## begin antigen ##
source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh
# antigen theme miloshadzic
#
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions --branch=develop
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle hlissner/zsh-autopair
antigen bundle rupa/z
antigen bundle lukechilds/zsh-nvm
antigen bundle thewtex/tmux-mem-cpu-load
#
antigen bundle command-not-found
antigen bundle git
antigen bundle heroku
#

## don't use powerline9k inside emacs ##
# antigen theme halfo/lambda-mod-zsh-theme
antigen theme fino

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
export PATH="/usr/bin/vendor_perl:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/snap/bin"
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
export ARCHFLAGS="-arch x86_64"
export NVM_DIR=$(cd ~/.nvm && pwd -P)
## end exports ##

## nvm init
#. "/usr/local/opt/nvm/nvm.sh"

## setup default nvm alias if inside vim
if [ -n "$VIMRUNTIME" ]; then
  nvm alias default stable
fi

## begin aliases ##
alias run='g++ -std=c++11 -DDEBUG -O2'
alias js="git status"
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

## begin ionic android ##
# Create a JAVA_HOME variable, determined dynamically
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/
export PATH=${JAVA_HOME}/bin:$PATH
# export ANDROID_HOME=/opt/android-sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export GRADLE_HOME=$HOME/.sdkman/candidates/gradle/5.2.1/
export PATH=$PATH:$GRADLE_HOME/bin
## end ##

export EDITOR="$(which vim)"

[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/tensor/.sdkman"
[[ -s "/Users/tensor/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/tensor/.sdkman/bin/sdkman-init.sh"

export FIREFOX_BINARY_PATH="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#797979'
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'
