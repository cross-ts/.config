---
name: nvim-lsp-add
description: Neovim に新しい LSP を追加するスキル。新しい言語サーバーの設定ファイルを `nvim/lua/configs/lsp/` と `nvim/after/lsp/` の両方に生成し、mise でバイナリ管理も行う。ユーザーが「〇〇のLSPを追加して」「〇〇用のLanguage Serverを設定して」「nvimにXXXを入れたい」等と言った場合は必ずこのスキルを使うこと。LSP、Language Server、lspconfig といったキーワードが出たら積極的にこのスキルを参照すること。
---

# Neovim LSP 追加スキル

Neovim 0.11.0 以降のネイティブ LSP クライアント機能を使った構成に新しい LSP を追加する。
LSP バイナリは mise で管理するため、nvim 設定と mise 設定の両方を更新する。

## 構成の概要

- `nvim/lua/configs/lsp/<name>.lua` — 実際の設定ファイル（`vim.lsp.Config` 型を返す）
- `nvim/after/lsp/<name>.lua` — ローダーファイル（上の設定を `require` して返すだけ）
- `mise/config.toml` — LSP バイナリのインストール定義とタスク定義

nvim-lspconfig のデフォルト設定をベースに、必要な部分だけ上書きする設計。

## 手順

### 1. nvim-lspconfig のドキュメントで LSP 名を確認

https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md を参照して、追加したい LSP が存在するか、正確なサーバー名と default `cmd` を確認する。

WebFetch でこの URL を取得して検索するか、ユーザーがすでにサーバー名を知っている場合はそのまま使用する。

### 2. mise/config.toml を更新

`mise/config.toml` の `[tools]` セクションと `[tasks]` セクションに追記する。

**`[tools]` セクション — LSP バイナリのインストール**

LSP の配布方法に応じて適切なプレフィックスを使う:

| プレフィックス | 用途 | 例 |
|---|---|---|
| `"npm:<pkg>"` | npm パッケージ | `"npm:typescript-language-server"` |
| `"pipx:<pkg>"` | Python パッケージ | `"pipx:python-lsp-server"` |
| `"go:<module>"` | Go モジュール | `"go:golang.org/x/tools/gopls"` |
| `"cargo:<crate>"` | Rust crate | `"cargo:rust-analyzer"` |
| `"gem:<gem>"` | Ruby gem | `"gem:ruby-lsp"` |
| `"github:<owner>/<repo>"` | GitHub releases | `"github:LuaLS/lua-language-server"` |

バージョンは基本的に `"latest"` を使う（既存ツールに合わせる）。

**`[tasks."lsp:<lang>"]` セクション — mise タスク定義**

nvim-lspconfig の `default_config.cmd` に合わせた起動コマンドを設定する:

```toml
[tasks."lsp:<lang>"]
description = "<LSP の説明>"
run = "<起動コマンド>"
```

**既存のタスク例（参考）:**

```toml
[tasks."lsp:go"]
description = "Go language server"
run = "gopls"

[tasks."lsp:typescript"]
description = "TypeScript & JavaScript Language Server"
run = "typescript-language-server --stdio"
```

### 3. nvim 設定ファイルを作成

`nvim/lua/configs/lsp/<server-name>.lua` を作成する。

**デフォルト設定のみ使う場合（ほとんどのケース）:**

```lua
--- @type vim.lsp.Config
return {
}
```

**カスタム設定が必要な場合（特定の filetype 追加、init_options 等）:**

```lua
--- @type vim.lsp.Config
return {
  -- 必要な設定のみ上書き
  filetypes = { 'foo', 'bar' },
}
```

### 4. ローダーファイルを作成

`nvim/after/lsp/<server-name>.lua` を作成する。必ず以下の形式にする:

```lua
--- @see configs.lsp.<server-name>
return require("configs.lsp.<server-name>")
```

## 既存ファイルの例

参考として既存の設定を見るには:
- シンプル: `nvim/lua/configs/lsp/bashls.lua`
- カスタム設定あり: `nvim/lua/configs/lsp/intelephense.lua`
- mise の既存 LSP ツール定義: `mise/config.toml` の `# Language Servers` セクション

## 注意点

- ファイル名はサーバー名と完全に一致させること（nvim-lspconfig の命名に従う）
- `nvim/lua/configs/lsp/` と `nvim/after/lsp/` の**両方**を必ず作成すること
- 設定の上書きは最小限に留める。デフォルトで動く場合は空の `{}` を返すだけでよい
- `vim.lsp.enable` の呼び出しはユーザーが別途行うため、このスキルでは不要
- nvim-lspconfig に存在しない LSP（独自サーバー等）は mise タスクのみ追加し、nvim 側は手動設定が必要な旨をユーザーに伝える
