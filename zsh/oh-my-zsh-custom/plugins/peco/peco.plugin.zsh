# ====================================
# peco
# ====================================

setopt hist_ignore_all_dups

# select command history
function peco_select_history () {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco_select_history
bindkey '^r' peco_select_history

# selcte directory
function peco-jump () {
    local jump_dir=$(j | cut -d'/' -f2-| peco --query "$LBUFFER")
    if [ -n "$jump_dir" ]; then
        BUFFER="cd /${jump_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-jump
bindkey '^j' peco-jump

# select git repository by ghq command
function peco-src () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# file name search
function peco-filename-search() {
    $(find . -name "*${1}*" | grep -v "/\." | peco)
}
zle -N peco-filename-search
bindkey '^f' peco-filename-search

# select ssh host from ~/.ssh/config
function peco-ssh() {
    ssh $(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|peco|awk "{print \$2}")
}

# select pid by `ps aux`
function peco-ps() {
    $(ps aux | peco | awk '{print $2}')
}

# select branch, and checkout
function peco-git-checkout() {
    local res
    local branch=$(git branch -a | peco | tr -d ' ')
    if [ -n "$branch" ]; then
        if [[ "$branch" =~ "remotes/" ]]; then
            local b=$(echo $branch | awk -F'/' '{print $3}')
            res="git checkout -b ${b} ${branch}"
        else
            res="git checkout ${branch}"
        fi
    fi
}

# select git log
function peco-git-log() {
    $(git log --oneline --decorate=full | peco | awk '{print $1}')
}

# select tmux session
function peco-tmux-session() {
    $(tmux list-sessions | peco | awk -F':' '{print $1}')
}
