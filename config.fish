## rbenv init
status --is-interactive; and . (rbenv init -|psub)

## begin exports ##
set -gx PATH $HOME/.rbenv/shims /usr/local/bin /usr/bin /bin /usr/sbin /sbin
set -gx ARCHFLAGS "-arch x86_64"

set -gx RAILS_ENV development
set -gx PORT 5000

set -gx NVM_DIR $HOME/.nvm

# set -g TERM xterm-256color
set -g LC_CTYPE en_US.UTF-8
set -g LC_ALL en_US.UTF-8
## end exports ##

## begin aliases ##
alias run "g++ -std=c++11 -DDEBUG -O2"
alias js "git st"
alias jl "git pull upstream master"
alias jc "git cb"
alias jp "git push"
alias ja "git checkout -- "
alias jd "git add"
alias jo "git cm "
alias jg "git checkout "
alias merge "git merge master"
alias jgm "git checkout master"
## end aliases ##