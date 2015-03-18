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
