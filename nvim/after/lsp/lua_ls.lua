--- @type vim.lsp.Config
return {
  cmd = { 'mise', 'run', '-q', 'lsp:lua' },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
        pathStrict = true,
      },
      diagnostics = {
        globals = { "vim" },
      },
      hint = {
        enable = true,
        setType = true,
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          vim.fn.stdpath('data') .. '/lazy/lazy.nvim',
        },
      },
    },
  },
}
