-- ansible-lint checks playbooks for practices and behavior that could potentially be improved and can fix some of the most common ones for you
---@link https://github.com/ansible/ansible-lint
---@link https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#ansiblelint
return require('null-ls').builtins.diagnostics.ansiblelint
