# ====================================
# Functions
# ====================================

# [Description] ^を押してcd..する
# [Reference] http://qiita.com/items/b01536fa63d9f8fadf4f
function cdup() {
    if [ -z "$BUFFER" ]; then
        echo
        cd ..
        if type precmd > /dev/null 2>&1; then
            precmd
        fi
        local precmd_func
        for precmd_func in $precmd_functions; do
            $precmd_func
        done
        zle reset-prompt
    else
        zle self-insert '^'
    fi
}
zle -N cdup
bindkey '\^' cdup

# [Description] hub = git
# [Reference] http://blog.toshimaru.net/github-and-hub
function git() {
    hub "$@"
}

# [Description] ^G^S = git status --short --branch
# [Reference] http://qiita.com/yuku_t/items/e58cbecf13407446bd50
function git_status() {
    if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
        echo git status --short --branch # git statusを実行したっぽくみせかける
        git status --short --branch
    fi
    zle reset-prompt
}
zle -N git_status git_status  # git_status関数をgit_status widgetとして登録
bindkey '^G^S' git_status

function copyline() {
    print -rn $BUFFER | pbcopy; zle -M "Copied: ${BUFFER}"
}
zle -N copyline
bindkey '@@' copyline

# ---------------------------------------------------
# peco
# ---------------------------------------------------
setopt hist_ignore_all_dups

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