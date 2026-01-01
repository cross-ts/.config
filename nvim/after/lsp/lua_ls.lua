--- @type vim.lsp.Config
return {
  cmd = { 'mise', 'run', 'lsp:lua' },
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
        },
      },
    },
  },
}
