---
description: "Create a pull request"
---

変更内容を適切な粒度のコミットに分割したPullRequestを作成すること。

- Read @.github/pull_request_template.md に従うこと
- Draftで作成すること
- push時は`git push -u origin <branch_name>` のように `--set-upstream` を指定すること
- コマンドの例: `gh pr create --draft --title "title" --body "body"`
