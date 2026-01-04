---@link https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#trail_space
return require("null-ls").builtins.diagnostics.trail_space.with({
    disabled_filetypes = { "markdown" },
})
