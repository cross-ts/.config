# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

個人開発環境の設定ファイル群（dotfiles）を管理するリポジトリ。XDG Base Directory Specification に準拠し、各ツールの設定を対応するサブディレクトリで管理している。

## セットアップ

README.md に記載のとおり、初期セットアップはシンボリックリンクを手動で作成する:

```bash
ln -s ~/.config/zsh/.zshenv ~/.zshenv
ln -s ~/.config/claude ~/.claude
ln -s ~/.config/gemini ~/.gemini
ln -s ~/.config/serena ~/.serena
```

## ツールバージョン管理 (mise)

`mise/config.toml` で全ランタイム・ツールを一元管理している。バージョン確認・更新:

```bash
mise list              # インストール済みツール一覧
mise upgrade           # 全ツールのアップグレード
mise install           # config.toml に基づきインストール
```

## Neovim プラグイン管理

プラグインは `nvim/lazy-lock.json` でバージョン固定されている。

```bash
nvim --headless "+Lazy sync" +qa    # プラグイン同期
nvim --headless "+Lazy update" +qa  # プラグイン更新（GitHub Actions が毎週実行）
```

## 自動化（GitHub Actions）

`.github/workflows/` に2つのワークフローがある:
- **lazy-update.yml**: 毎週日曜 JST 00:00 に Neovim プラグインを自動更新し PR を作成
- **mise-upgrade.yml**: 毎週日曜 JST 00:00 に mise 管理ツールを自動更新し PR を作成

Dependabot も有効。PRは `lazy-update/*` ブランチで作成される。

## アーキテクチャ

### ディレクトリ構成の方針

各ツールは独立したサブディレクトリで管理。設定変更は該当ディレクトリ内のファイルのみ編集する。

### Zsh 設定 (`zsh/`)

- `.zshenv` → XDG パス定義、Homebrew の PATH 設定
- `.zshrc` → sheldon によるプラグイン読み込み、starship プロンプト
- `modules/` → 機能別モジュール（遅延読み込み対応）
- `functions/` → カスタム関数（`brew-require`, ログ関数等）
- `bin/` → 実行可能スクリプト

sheldon (`sheldon/plugins.toml`) で zsh-defer による遅延読み込みを活用してシェル起動を最適化している。

### Neovim 設定 (`nvim/`)

`nvim/init.lua` が起点。lazy.nvim でプラグイン管理。設定は3フェーズ:
1. `before/` → プラグイン読み込み前の設定（colorscheme 等）
2. `plugins/` → 各プラグインの設定
3. `after/` → プラグイン読み込み後の設定

`nvim/indent/json.lua` は JSON インデント設定（カスタム）。

### mise タスク (`mise/config.toml`)

mise の `[tasks]` セクションに以下のカスタムタスクを定義:
- 各言語サーバーの起動タスク
- MCP サーバー（GitHub、Serena、Git）の起動タスク

### Git 設定 (`git/`)

- SSH 署名に 1Password (`op-ssh-sign`) を使用
- エディタは vim
- エイリアス: `br`=branch, `co`=checkout, `cm`=commit, `st`=status 等

### AI ツール設定

- `claude/settings.json` → 言語設定(日本語)、デフォルト permission mode
- `serena/serena_config.yml` → MCP サーバー設定
- `codex/` → Codex エージェント設定（rules, skills）

## コミット規約

コミットメッセージは日本語で記述する。
