# Homebrew管理

## 復元

```bash
brew bundle
```

## Brewfileの更新

インストール・アンインストールを行ったら必ず [Brewfile](../Brewfile) を更新すること。

```bash
# brew bundle dump --file="$(chezmoi source-path)/Brewfile" --force --no-describe
brew bundle dump --force --no-describe
```

## 依存削除

アンインストール時に依存パッケージ毎削除したいので、[rmtree](https://github.com/beeftornado/homebrew-rmtree) を使うこと。

```bash
brew rmtree <package>
# preview
brew rmtree --dry-run <package>
```
