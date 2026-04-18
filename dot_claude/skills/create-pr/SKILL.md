---
name: create-pr
description: コミット済みの変更をリモートにプッシュしてプルリクエストを作成する。ユーザーが「PR作成」「pull request を作って」「プルリクエスト」「push して PR」などと言った場合に使用する。`draft` 引数でドラフトPRを作成可能。
argument-hint: "[draft]"
context: fork
allowed-tools: Bash, Read
model: claude-sonnet-4-6
---

# Create PR

現在のブランチをリモートリポジトリにプッシュし、pull-requestを作成する。

## ルール

- ファイルのステージングやコミット操作は一切行わない
- **Draft Option**: デフォルトでは標準のオープンPRを作成すること。ユーザーがコマンド内で明示的に "draft" と指定した場合（例: `/create-pr draft`）にのみ `--draft` フラグを付与する。
- **言語**: PRタイトルおよび本文は英語で記述する。ユーザーから明示的に日本語での記述を指示された場合のみ日本語を使用する。

## 実行手順

1. **プッシュ**
    - upstreamフラグを使用して、現在のブランチをプッシュする
      `git push -u origin <branch_name>`

2. **変更内容の分析**: 以下のコマンドを並列で実行し、PRに必要な情報を収集する
    - `git log $(git merge-base HEAD main)..HEAD --oneline` - mainブランチからの全コミット一覧を確認
    - `git diff $(git merge-base HEAD main)..HEAD --stat` - 変更ファイルの概要を確認

3. **PRの作成**
    - コミットメッセージとブランチ名に基づいて、簡潔なPRのタイトルと本文を生成する
    - `.github/pull_request_template.md` にテンプレートが存在するか確認する。存在する場合は、 `Read` ツールを使用してその構造を適用する。
      - テンプレートが存在しない場合は、以下のテンプレートを使用する:
        ```
        ## Summary
        <brief description of the changes>

        ## Changes
        - <change 1>
        - <change 2>
        - ...

        ## Related Issues / Links
        - Fixes #<issue-number>

        🤖 Generated with Claude Code
        ```
    - GitHub CLIを使用してPRを作成する（bodyはHEREDOCで渡すと改行が正しく反映される）:
      ```bash
      gh pr create [--draft] --title "<title>" --body "$(cat <<'EOF'
      <body>
      EOF
      )"
      ```

4. **PR作成の確認**
    - PRへのリンクを表示してユーザーに報告する

## トラブルシューティング

- `gh` コマンドが見つからない、または認証されていない場合は、処理を中断し、ユーザーに設定を促すこと
- プッシュが拒否された場合は、処理を中断し、ユーザーにコンフリクトの解消（pullやrebaseなど）を依頼すること
- `main` ブランチが存在しない場合は `git symbolic-ref refs/remotes/origin/HEAD` でデフォルトブランチを確認すること
