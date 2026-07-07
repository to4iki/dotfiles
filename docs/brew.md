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

`brew bundle dump` はローカルの trust 状態をそのまま書き出す。Brewfile は手で直さず、dump の出力を正とする。

### 非公式 tap の trust

Homebrew 6 以降、非公式 tap は trust が必要。個別 trust より冗長になるため、**tap 行に `trusted: true`** で管理する。

```bash
brew trust --tap user/repo
brew bundle dump --force --no-describe
```

## 依存削除

アンインストール時に依存パッケージ毎削除したいので、[rmtree](https://github.com/beeftornado/homebrew-rmtree) を使うこと。

```bash
brew rmtree <package>
# preview
brew rmtree --dry-run <package>
```
