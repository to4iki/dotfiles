# CLAUDE.md - Global Level

## 開発スタイル

- TDDで開発する（探索 → Red → Green → Refactoring）
- 不明瞭な指示は質問して明確にする

## ワークフロー

軽微な修正以外の実装は、`git-wt` スキルを利用してworktreeで作業する。

- 適用条件:
  - Plan mode終了後、コード変更を伴う実装を開始する時
- 除外条件:
  - 単一ファイルの軽微な修正（typo、コメント追加等）
  - READMEやドキュメントのみの変更
