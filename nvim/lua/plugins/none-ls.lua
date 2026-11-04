-- null-ls.nvim reloaded / Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
---@type configs.PluginSpec
return {
  'none-ls.nvim',
  src = 'https://github.com/nvimtools/none-ls.nvim',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  after = function()
    local sources = {}
    for _, source in ipairs(vim.api.nvim_get_runtime_file('lua/configs/none-ls/*.lua', true)) do
      local source_name = vim.fn.fnamemodify(source, ':t:r')
      table.insert(sources, require('configs.none-ls.' .. source_name))
    end

    require('null-ls').setup({
      sources = sources,
    })
  end,
}
