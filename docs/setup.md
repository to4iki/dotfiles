# プロジェクトセットアップ

## gh

### extensions

```sh
gh extension install to4iki/gh-openpr
gh extension install babarot/gh-infra
```

### skills

```sh
gh skill install vercel-labs/opensrc opensrc --agent <claude-code|codex|...> --scope user
```

## Yazi

### plugins

```bash
ya pkg add BennyOe/tokyo-night
ya pkg add yazi-rs/plugins:smart-enter
ya pkg add yazi-rs/plugins:git
```

## npm

### czg

```sh
npm install -g czg
```

[OepnAI](https://cz-git.qbb.sh/recipes/openai) トークンを設定する。

```sh
# GitHub Models の設定
czg --api-key="ghp_xxxxxx" --api-endpoint="https://models.inference.ai.azure.com" --api-model="gpt-4o-mini"
```

### opensrc

```sh
npm install -g opensrc
```
