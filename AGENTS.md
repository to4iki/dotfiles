# AI開発ガイド

chezmoi dotfiles 管理の運用についてまとめる。

## 開発環境

- ソースディレクトリ: `~/src/github.com/to4iki/dotfiles`

## 開発コマンド

- `make apply` - 1password管理外のファイルを反映
- `make secrets-apply` - 1passwordで管理しているシークレットを反映
- `make setup-gh-extensions` - ghコマンドのエクステンションをインストールする
- `make setup-gh-skills [AGENT=...]` - グローバルにエージェントスキルをインストールする
- `make setup-yazi-packages` - yaziパッケージをインストール
- `make setup-npm` - グローバルにnpmパッケージをインストールする
- `make update-gh-skills` - エージェントスキルのアップデート
