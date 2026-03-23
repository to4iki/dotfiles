---
name: git-worktree
description: >
  git-wt コマンドで Git worktree を作成し、作業ディレクトリを分離して実装を行う。
  作業完了後はユーザー確認を経て worktree を削除する。
  ユーザーが「worktree」「ワークツリー」「ブランチを分けて」「wt で」など明示的に指定した場合にのみ起動する。
---

# Git Worktree

`git-wt` で worktree を作成し、メインブランチを汚さず作業する。
失敗しても `git wt -d` で綺麗に元に戻せる。

## 実行手順

### Step 1: worktree を作成する

タスク内容からブランチ名を決め、worktree を作成する。

```bash
git wt <branch-name> --nocd
```

`.wt/<branch-name>/` 配下に worktree が作成され、パスが出力される。
出力されたパスを `WORKTREE_PATH` として記録する。

### Step 2: worktree 内で作業する

以降の操作はすべて `WORKTREE_PATH` 配下で行う。

- Read/Edit/Write ツール: `$WORKTREE_PATH/src/...` のように絶対パスで指定
- Bash: `cd $WORKTREE_PATH && <command>`

### Step 3: 完了報告

作業完了後、ユーザーに以下を伝える:
- 変更ファイル一覧と概要
- worktree パス
- マージ方法（例: `cd $WORKTREE_PATH && git push -u origin <branch-name>` → PR作成）

### Step 4: ユーザー確認後に削除

ユーザーの確認を得てから削除する。自動削除はしない。

```bash
# 安全な削除
git wt -d <branch-name>

# 強制削除（ユーザーが明示的に指示した場合のみ）
git wt -D <branch-name>
```

## ブランチ命名規則

| 種別 | プレフィックス | 例 |
|-----|-------------|-----|
| 新機能 | `feat/` | `feat/add-dark-mode` |
| バグ修正 | `fix/` | `fix/image-upload-error` |
| リファクタリング | `refactor/` | `refactor/auth-module` |
| ドキュメント | `docs/` | `docs/update-readme` |
| 設定変更 | `chore/` | `chore/update-deps` |

## 複数エージェントの並行作業

Agent ツールで複数サブエージェントを起動する場合、それぞれ別ブランチ名で worktree を作成する。
各エージェントに worktree パスを明示的に伝える。

```bash
git wt feat/feature-a --nocd  # → .wt/feat/feature-a
git wt feat/feature-b --nocd  # → .wt/feat/feature-b
```
