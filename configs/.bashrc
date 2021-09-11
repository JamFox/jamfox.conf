#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

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
alias gco='git checkout'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias gd='git diff'

alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias de='cd ~/Desktop'
alias do='cd ~/Downloads'
alias doc='cd ~/Documents'
alias pic='cd ~/Pictures'

alias base='ssh root@base.hpc.taltech.ee'

function largestfiles() {
    du -h -x -s -- * | sort -r -h | head -20;
}

function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

# Set the prompt.

function bash_prompt(){
    PS1='${debian_chroot:+($debian_chroot)}'${blu}'$(git_branch)'${pur}' \W'${grn}' \$ '${clr}
}

bash_prompt

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

eval $(keychain --eval --quiet --noask ~/.ssh/*)
