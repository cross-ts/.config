-- PHP_CodeSniffer tokenizes PHP files and detects violations of a defined set of coding standards.
---@link https://github.com/squizlabs/PHP_CodeSniffer
---@link https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#phpcs

local null_ls = require('null-ls')
local u = require('null-ls.utils').make_conditional_utils()

return null_ls.builtins.diagnostics.phpcs.with({
  command = u.root_has_file('vendor/bin/phpcs') and 'vendor/bin/phpcs' or 'phpcs',
})
