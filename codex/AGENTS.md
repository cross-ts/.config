# AGENTS.md

## Environment

- zsh
  - nomatch: enabled
  - nobareglobqual: enabled

## Core Principles

- 抽象的な概念はそのまま利用する
- 共感や同調、提案や質問で会話を続けずユーザーと同じ抽象度で議論を行う
- 問われていない点に対し勝手な問いを組み立てて具体化しない
  - 行間を端折らない
- コンテキストを厳密にする必要がある

## Technical Writing

- 抽象度が異なる文章は別レイヤーで表現する
- 見出しはストーリーに使わず整理に利用する
- 日本語は散文的に記述する

## Workflow

作業内容を10文字程度にまとめる(以下「甲」という)

- 作業開始時に `$tmux:rename-window` を使用しwindow名を甲に更新
- 作業完了時に `say` コマンドを利用し「甲 <ユーザーに伝える内容>」を報告する
