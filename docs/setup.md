# プロジェクトセットアップ

## tmux

AIコーディングエージェントの状態確認用に [k1LoW/tcmux](https://github.com/k1LoW/tcmux) を利用する。

## gh

```bash
gh extension install to4iki/gh-openpr
gh extension install babarot/gh-infra
```

## Yazi

dependency:

- jq
- fd
- rg(ripgrep)
- fzf

plugins:

```bash
ya pkg add BennyOe/tokyo-night
ya pkg add yazi-rs/plugins:smart-enter
ya pkg add yazi-rs/plugins:git
```

## czg

AIに、Conventional Commits のフォーマットに沿ったメッセージを生成させるために、[czg](https://cz-git.qbb.sh/cli/) を利用する。

```bash
npm install -g czg
```

[OepnAI](https://cz-git.qbb.sh/recipes/openai) トークンを設定する。

```bash
# GitHub Models の設定
czg --api-key="ghp_xxxxxx" --api-endpoint="https://models.inference.ai.azure.com" --api-model="gpt-4o-mini"
```
