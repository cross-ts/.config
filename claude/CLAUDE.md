# CLAUDE.md

## Forbidden

- Don't use `Compound Commands`

## Core Principles

`YAGNI` and `KISS`

## Main Session Tasks

- ユーザーの指示を解釈しワークフローを設計
  - ソフトウェアの全体設計
  - 設計やコードのレビュー
  - タスクの進捗単位でのgit操作(init, commit, push, pull request)の管理
  - 知識の再利用設計と管理
- 適切なタスク分割とサーブエージェントへの委譲
  - coding: `coding-worker`
  - 大きな標準出力が想定されるコマンド: `output-summarizer`
