-- PHP Static Analysis Tool - discover bugs in your code without running it!
---@link https://github.com/phpstan/phpstan
---@link https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#phpstan

local null_ls = require('null-ls')
local u = require('null-ls.utils').make_conditional_utils()

return null_ls.builtins.diagnostics.phpstan.with({
  command = u.root_has_file('vendor/bin/phpstan') and 'vendor/bin/phpstan' or 'phpstan',
})
