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
