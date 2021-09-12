#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\033[38;5;217m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;216m\]\h\[$(tput sgr0)\]: \[$(tput sgr0)\]\[\033[38;5;159m\](\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))\[$(tput sgr0)\] \w\n> \[$(tput sgr0)\]"

HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

alias ls='ls --color=auto'
alias sl='ls --color=auto'
alias ll='ls -la'
alias l='ls -la'
alias lart='ls -lart'

alias c='clear'
alias h='history'
alias tree='tree --dirsfirst -F'
alias mkdir='mkdir -p -v'
alias grep='grep --color=auto'

alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gac='git add --all && git commit'
alias gco='git checkout'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'
alias gpo='git push origin'

alias apb='ansible-playbook'

alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias docu='cd ~/Documents'
alias pict='cd ~/Pictures'

alias sshbase='ssh root@base.hpc.taltech.ee'

function largestfiles() {
    du -h -x -s -- * | sort -r -h | head -20;
}

function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

function hg() {
    history | grep "$1";
}

function git_init() {
    if [ -z "$1" ]; then
        printf "%s\n" "Please provide a directory name.";
    else
        mkdir "$1";
        builtin cd "$1";
        pwd;
        git init;
        touch readme.md .gitignore LICENSE;
        echo "# $(basename $PWD)" >> readme.md
    fi
}

eval $(keychain --eval --quiet ~/.ssh/*)
neofetch
