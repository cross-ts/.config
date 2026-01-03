-- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  main = 'Comment',
  config = function()
    local comment = require('Comment')
    local pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()

    comment.setup({
      pre_hook = pre_hook,
    })
  end
}
