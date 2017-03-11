## begin inits ##
#
## rbenv init
status --is-interactive; and . (rbenv init -|psub)
#
## end inits ##

## begin exports ##
set -gx PATH  $HOME/.rbenv/shims /usr/local/bin /usr/bin /bin /usr/sbin /sbin $GOPATH/bin
set -gx PATH  /usr/local/opt/bison/bin /usr/local/opt/flex/bin $PATH
set -gx PATH  $HOME/compilers/cs143/cool/bin $PATH

set -gx ARCHFLAGS "-arch x86_64"

set -gx RAILS_ENV development
set -gx PORT 3000

set -gx NVM_DIR $HOME/.nvm

set -gx GOPATH $HOME/goProjects

# set -g TERM xterm-256color
set -g LC_CTYPE en_US.UTF-8
set -g LC_ALL en_US.UTF-8
## end exports ##

## begin aliases ##
alias run "g++ -std=c++11 -DDEBUG -O2"
alias js "git st"
alias jl "git pull upstream master or git pull origin master"
alias jc "git cb"
alias jp "git push"
alias ja "git checkout -- "
alias jd "git add"
alias jo "git cm "
alias jg "git checkout "
alias merge "git merge master"
alias jgm "git checkout master"
alias jpm "git push origin master"
alias jt "git pull origin master"
## end aliases ##
