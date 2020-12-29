source ~/git-completion.bash

alias ll='ls -l'
alias l1='ls -1'
alias gs='git status'
alias gf='git fetch'
alias drsp='dirs -p'
alias gcm='git commit -a -m'
alias gln='git log --name-status'
alias cl='clear'
alias gff='git merge --ff-only'
alias gdc='git diff --cached'
alias gri='git rebase -i'
alias ncopy="tr -d '\n'|pbcopy"
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
function findweb() { find . -type f -a \( -name "*.inc" -o -name "*.php" -o -name "*.html" -o -name "*.js" \)|grepfiles "$1"; }

function findphp()
{
    find . -type f -a \( -name "*.inc" -o -name "*.php" \) | grepfiles "$1" "$2"
}

function grepfiles()
{
    if [ -n "$2" -a "$1" = "-s" ]; then
        xargs -L1 grep -l "$2"
    else
        xargs -L1 grep -l -i "$1"
    fi
}

# Use with less -R for color
function searchphp() { find . -name "*.php" -type f | xargs -L1 grep -i -C6 -H --color=always "$1"; }

function delbranch() { git push origin :$1; git branch -d $1; }
function getcol() { awk '{print $'$1'}'; }
function trs() { mv "$@" ~/.Trash; }

function dockbash()
{
    docker exec -t -i "$1" bash
}

export HOMEBREW_NO_ANALYTICS=1
export PS1="\[\e[34;50m\]\h:\W \u\$\[\e[30;50m\] "

export PATH="$(brew --prefix php)/bin:$PATH"
export PATH="~/scripts:$PATH"
