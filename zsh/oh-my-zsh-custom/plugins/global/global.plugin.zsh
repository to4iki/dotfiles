# ====================================
# ENVIRON
# ====================================

# ------------------------------------
# LANGUAGE
# ------------------------------------
export LANG=ja_JP.UTF-8

# ------------------------------------
# EDITOR
# ------------------------------------
export EDITOR=vim

# ------------------------------------
# Command History
# ------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_all_dups # 履歴と重複したコマンドの古い方を削除
setopt hist_ignore_dups     # 直前と同じコマンドラインは履歴に追加しない
setopt share_history        # コマンド履歴の共有
setopt inc_append_history   # 履歴をインクリメンタルに追加
setopt hist_no_store        # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks   # 余分な空白は詰めて記録

# ------------------------------------
# Tmux
# ------------------------------------
unsetopt share_history

# ====================================
# TOOL
# ====================================

# ------------------------------------
# z
# ------------------------------------
_Z_CMD=j
source /usr/local/etc/profile.d/z.sh
precmd() {
  _z --add "$(pwd -P)"
}

# ------------------------------------
# zaw, https://github.com/zsh-users/zaw
# ------------------------------------
# [Description] zshのインタインターフェース拡張
# [Reference] http://yagays.github.io/blog/2013/05/20/zaw-zsh/
#             http://qiita.com/scalper/items/4728afaac9962bf91bfa
if [ -f ~/dotfiles/.lib/zaw/zaw.zsh ]; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*' recent-dirs-max 5000
  zstyle ':chpwd:*' recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both

  source ~/dotfiles/.lib/zaw/zaw.zsh
  zstyle ':filter-select' case-insensitive yes
  bindkey '^X' zaw
  bindkey '^@' zaw-cdr
  bindkey '^h' zaw-history
  bindkey '^[g' zaw-git-branches
  bindkey '^[@' zaw-gitdir

  function zaw-src-gitdir () {
    _dir=$(git rev-parse --show-cdup 2>/dev/null)
    if [ $? -eq 0 ]
    then
      candidates=( $(git ls-files ${_dir} | perl -MFile::Basename -nle \
        '$a{dirname $_}++; END{delete $a{"."}; print for sort keys %a}') )
    fi
    actions=("zaw-src-gitdir-cd")
    act_descriptions=("change directory in git repos")
  }

  function zaw-src-gitdir-cd () {
    BUFFER="cd $1"
    zle accept-line
  }
  zaw-register-src -n gitdir zaw-src-gitdir
fi

# ------------------------------------
# growl
# ------------------------------------
# [Description] zshのコマンド終了をGrowlで通知
# [Reference] http://mba-hack.blogspot.jp/2013/10/zshgrowl.html
if [ -f ~/dotfiles/.lib/growl.zsh ]; then
  source ~/dotfiles/.lib/growl.zsh
fi

# ------------------------------------
# bd
# ------------------------------------
# [Description] 親ディレクトリへの移動
if [ -f ~/dotfiles/.lib/bd.zsh ]; then
  source ~/dotfiles/.lib/bd.zsh
fi

# ------------------------------------
# Completion
# ------------------------------------
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit && compinit -u
