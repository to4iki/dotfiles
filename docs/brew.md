# Homebrew管理

## 復元

```bash
brew bundle --global
```

## Brewfileの更新

インストール・アンインストールを行ったら必ず [Brewfile](../Brewfile) を更新すること。

```bash
# brew bundle dump --file="$(chezmoi source-path)/Brewfile" --force
brew bundle dump --force
```

## 依存削除

アンインストール時に依存パッケージ毎削除したいので、[rmtree](https://github.com/beeftornado/homebrew-rmtree) を使うこと。

```bash
brew rmtree <package>
# preview
brew rmtree --dry-run <package>
```
