# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# to allow control-s to save file in vim
vim() STTY=-ixon command vim "$@"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby bundler brew zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
source ~/.bin/tmuxinator.zsh

export JAVA_HOME=$(/usr/libexec/java_home)
export JDK_HOME=$(/usr/libexec/java_home)
export EDITOR='vim'
export PATH="/Users/dspector/.rbenv/shims:/Users/dspector/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/dspector/bin:/usr/local/sbin:/usr/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias g='git status'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gp='git push'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gr='git remote -v'
alias gd='git diff --ignore-space-at-eol -b -w --ignore-blank-lines'
alias gpl='git pull origin master'

alias mmotion='mmotion.command'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias insecure='open -a Google\ Chrome --args --disable-web-security'
alias bb='ssh dspector@webserver-x.stg.lifebooker.com'
alias updatesub='git submodule update --init --recursive && git submodule update --recursive'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vundle='vim +PluginInstall +qall'
alias lb_unicorn='bundle exec unicorn -c config/unicorn.rb -p 3001'
alias cat="pygmentize -O encoding=UTF-8 -g"

alias elastic="cd /usr/local/Cellar/elasticsearch/1.4.2"
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'

alias pg-stg-db-app="psql -h pg-stg.cxkxxbcqadsr.us-east-1.rds.amazonaws.com -d lifebooker -U lifebooker" 
alias pg-stg-db-dba="psql -h pg-stg.cxkxxbcqadsr.us-east-1.rds.amazonaws.com -d lifebooker -U dba" 
alias pg-stg-db-read="psql -h pg-stg.cxkxxbcqadsr.us-east-1.rds.amazonaws.com -d lifebooker -U lifebooker_read"
alias pg-prod-db-app="psql -h pg-prd.cxkxxbcqadsr.us-east-1.rds.amazonaws.com -d lifebooker -U lifebooker" 
alias pg-prod-db-dba="psql -h pg-prd.cxkxxbcqadsr.us-east-1.rds.amazonaws.com -d lifebooker -U dba" 
alias pg-prod-db-read="psql -h pg-prd.cxkxxbcqadsr.us-east-1.rds.amazonaws.com -d lifebooker -U lifebooker_read"

alias prod_console="eb ssh && cd /var/app/current && rails c"

export LB_ENV=production
export WORKON_HOME=$HOME/code/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

source /usr/local/bin/virtualenvwrapper.sh
. ~/z.sh

eval "$(rbenv init - zsh)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
function radiation {
       local CURRENT_DIR=$(pwd)
       cd ~/radiation
       ruby bin/runner.rb
       cd $CURRENT_DIR
   }
