# hub = git
function git() {
    hub "$@"
}

# ^G^S = git status --short --branch
function git_status() {
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo git status --short --branch
        git status --short --branch
    fi
    zle reset-prompt
}
zle -N git_status git_status
bindkey '^G^S' git_status

# @@ = pbcopy
function copyline() {
    print -rn $BUFFER | pbcopy; zle -M "Copied: ${BUFFER}"
}
zle -N copyline
bindkey '@@' copyline
