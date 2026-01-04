-- Quickstart configs for Nvim LSP
---@type LazyPluginSpec
return {
  'neovim/nvim-lspconfig',
  cmd = {
    'LspInfo',
    'LspStart',
    'LspStop',
    'LspRestart',
    'LspLog',
  },
  event = {
    'BufNewFile',
    'BufReadPre',
  },
  config = function()
    -- after/lsp/*.lua ベースでLSPサーバーを自動有効化 (mason-lspconfig相当)
    local servers = {}
    for _, server in ipairs(vim.api.nvim_get_runtime_file('lua/configs/lsp/*.lua', true)) do
      local server_name = vim.fn.fnamemodify(server, ':t:r')
      servers[server_name] = true
    end
    vim.lsp.enable(vim.tbl_keys(servers))
  end,
}
