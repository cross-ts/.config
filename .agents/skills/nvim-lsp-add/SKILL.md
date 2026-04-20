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

### 1. 対象 LSP の特定とユーザーへの提示

ユーザーが言語名（例: 「Go」「Python」）だけを指定した場合、その言語に使える LSP が複数存在する可能性がある。
nvim-lspconfig のドキュメント（https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md）や既知の情報をもとに候補を洗い出し、ユーザーに提示して選択してもらう。

**ユーザーへの提示が必要なケース:**
- 1つの言語に対して複数の LSP が存在する場合（例: Python には `pylsp`, `pyright`, `ruff` 等がある）
- LSP が認証情報や外部ツール連携を必要とする場合（例: `actionsls` は GitHub トークンが必要）
- LSP が特殊な filetype 設定やスキーマ定義を必要とする場合（例: `jsonls` のカスタムスキーマ, `yamlls` の filetype 拡張）

**提示する情報:**
- LSP のサーバー名（nvim-lspconfig での名前）
- 簡単な特徴や違い
- 複雑な設定が必要かどうか

ユーザーが具体的なサーバー名を指定している場合（例: 「gopls を追加して」）はこのステップをスキップしてよい。

### 2. nvim-lspconfig のドキュメントで設定詳細を確認

https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md を参照して、正確なサーバー名、default `cmd`、必要な設定項目を確認する。

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

### 4. nvim 設定ファイルを作成

`nvim/lua/configs/lsp/<server-name>.lua` を作成する。
設定の複雑さに応じて以下のパターンから選択する。

**パターンA: デフォルト設定のみ（ほとんどのケース）**

```lua
--- @type vim.lsp.Config
return {
}
```

**パターンB: 軽い拡張（filetype 追加、settings 上書き等）**

```lua
--- @type vim.lsp.Config
return {
  filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.github-actions' },
}
```

**パターンC: 複雑な設定（認証・外部連携・動的な値の生成等）**

認証トークンの取得、リポジトリ情報の解析、外部コマンド実行などが必要な場合がある。
既存の複雑な設定例として `nvim/lua/configs/lsp/actionsls.lua` を参照すること。
このケースでは設定内容をユーザーに説明し、必要な前提条件（CLIツールのインストール等）も伝える。

### 5. ローダーファイルを作成

`nvim/after/lsp/<server-name>.lua` を作成する。必ず以下の形式にする:

```lua
--- @see configs.lsp.<server-name>
return require("configs.lsp.<server-name>")
```

## 既存ファイルの例

参考として既存の設定を読むこと:
- パターンA（デフォルト設定のみ）: `nvim/lua/configs/lsp/bashls.lua`
- パターンB（軽い拡張）: `nvim/lua/configs/lsp/intelephense.lua`, `nvim/lua/configs/lsp/yamlls.lua`, `nvim/lua/configs/lsp/jsonls.lua`
- パターンC（複雑な設定）: `nvim/lua/configs/lsp/actionsls.lua`
- mise の既存 LSP ツール定義: `mise/config.toml` の `# Language Servers` セクション

## 注意点

- ファイル名はサーバー名と完全に一致させること（nvim-lspconfig の命名に従う）
- `nvim/lua/configs/lsp/` と `nvim/after/lsp/` の**両方**を必ず作成すること
- 設定の上書きは最小限に留める。デフォルトで動く場合は空の `{}` を返すだけでよい
- `vim.lsp.enable` の呼び出しはユーザーが別途行うため、このスキルでは不要
- nvim-lspconfig に存在しない LSP（独自サーバー等）は mise タスクのみ追加し、nvim 側は手動設定が必要な旨をユーザーに伝える
