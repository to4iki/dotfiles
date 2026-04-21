# コミット生成

AIに、Conventional Commits のフォーマットに沿ったメッセージを生成させるために、[czg](https://cz-git.qbb.sh/cli/) を利用する。

## トークン設定

[OepnAI](https://cz-git.qbb.sh/recipes/openai) トークンを設定する。

```sh
# GitHub Models の設定
czg --api-key="ghp_xxxxxx" --api-endpoint="https://models.inference.ai.azure.com" --api-model="gpt-4o-mini"
```

## ルール

[dot_commitlintrc.mjs](../dot_commitlintrc.mjs)
