-- Nvim Treesitter configurations and abstraction layer
---@type configs.PluginSpec
return {
  'nvim-treesitter',
  src = 'https://github.com/nvim-treesitter/nvim-treesitter',
  build = function()
    -- :TSUpdate 相当 (install 直後は plugin/ が未 source でコマンドが無いため API を使う)
    require('nvim-treesitter').update(nil, { summary = true })
  end,
  lazy = false,
  after = function()
    local ensureInstalled = {
      -- Languages I use often
      'lua', 'python', 'typescript', 'php', 'phpdoc', 'ruby',
      -- Config files
      'json', 'yaml', 'git_config', 'gitignore',
      'hcl', 'terraform', 'nginx',
      -- Misc
      'gitcommit',
    }
    local alreadyInstalled = require('nvim-treesitter.config').get_installed()
    local parsersToInstall = vim.iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require('nvim-treesitter').install(parsersToInstall)

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
