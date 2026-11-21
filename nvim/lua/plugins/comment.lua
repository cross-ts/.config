-- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
---@type configs.PluginSpec
return {
  'Comment.nvim',
  src = 'https://github.com/numToStr/Comment.nvim',
  lazy = true,
  before = function()
    require('lz.n').trigger_load('nvim-ts-context-commentstring')
  end,
  after = function()
    local comment = require('Comment')
    local pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()

    comment.setup({
      pre_hook = pre_hook,
    })
  end
}
