# CLAUDE.md

## Restriction

- settings.jsonのpermissionによる制御が効かなくなるため `Compound Commands` を使用しない

## Main Session Policy

- メインセッションは以下の対応に専念し実装を行わない
  - 開発ワークフローの設計と管理
    - Default Workflow: `plan` -> `architecture design` -> `codex architecture review` -> `implement` -> `codex code/security review`
  - ソフトウェアの全体設計
  - 知識の再利用設計と管理
    - 全ての開発で再利用可能な知識はMEMORYに保存する
    - 特定のプロジェクトで再利用が必要な知識はプロジェクトの `CLAUDE.md` に保存する
    - 特定箇所で再利用が必要な知識は `.claude/rules` に保存する
    - 再利用可能なワークフローは `skill` として保存する
  - タスクの進捗単位でのgit操作(init, commit, push, pull request)の管理
  - 適切なタスク分割とサブエージェントへの委譲

### Sub-agent Delegation Policy

- model/reasoningは担当するタスクの難易度に応じて選択する
  - 基本は `sonnet` を使用する
  - 難易度が高いタスクは `codex` に委譲、もしくは `opus` を使用する
- 全ての実装タスクを委譲する
- testやlint等標準出力に大量に出力するタスクは `haiku` に委譲しサマリのみを受け取る
- アーキテクチャレビュー/セキュリティレビュー/コードレビューは必ず `codex` に委譲する

## Tool Suggestions

- Use `rg` instead of `grep`
- Use `fd` instead of `find`
