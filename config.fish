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
set -gx PATH  $HOME/.config/fnm/bin $PATH

set -gx ARCHFLAGS "-arch x86_64"

set -gx RAILS_ENV development
set -gx PORT 3000

set -gx NVM_DIR $HOME/.nvm

set -gx GOPATH $HOME/goProjects

# set -g TERM xterm-256color
set -g LC_CTYPE en_US.UTF-8
set -g LC_ALL en_US.UTF-8

# apps exports #
# tapdeal
fenv source ~/env-tap.sh

# supportory
set -gx BACKEND_URL http://localhost:3000/api
set -gx RAILS_URL http://localhost:3000
set -gx CLIENT_URL http://localhost:3001
set -gx CABLE_URL ws://localhost:3000/cable
set -gx CHATBOX_URL http://localhost:3000/chatbox/chatbox.js
set -gx CHATBOX_DIR $HOME/VeryCreatives/supportory_chatbox/

# staging
# set -gx BACKEND_URL http://supporotyr-api.very.hu/api
# set -gx rails_url http://supporotyr-api.very.hu
# set -gx client_url http://localhost:3001
# set -gx cable_url ws://supporotyr-api.very.hu/cable
# set -gx chatbox_url http://localhost:9000/chatbox.js
# set -gx chatbox_dir $home/verycreatives/supportory_chatbox/

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
alias pd 'bundle exec cap production deploy; bundle exec cap production puma:restart'
alias sd 'bundle exec cap staging deploy; bundle exec cap staging puma:restart'
## end aliases ##
