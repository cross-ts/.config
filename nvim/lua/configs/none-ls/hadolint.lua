-- Dockerfile linter, validate inline bash, written in Haskell
---@link https://github.com/hadolint/hadolint
---@link https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#hadolint
return require('null-ls').builtins.diagnostics.hadolint
