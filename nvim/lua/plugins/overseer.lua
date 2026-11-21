-- A task runner and job management plugin for Neovim
---@type configs.PluginSpec
return {
  'overseer.nvim',
  src = 'https://github.com/stevearc/overseer.nvim',
  cmd = {
    'OverseerToggle',
    'OverseerRun',
  },
  keys = {
    { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle Overseer" },
    { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run Overseer Task" },
  },
  -- :Make は自前で定義するため cmd に含めない (lz.n はロード時に cmd のスタブを削除する)
  beforeAll = function()
    vim.api.nvim_create_user_command("Make", function(params)
      -- Insert args at the '$*' in the makeprg
      local cmd, num_subs = vim.o.makeprg:gsub("%$%*", params.args)
      if num_subs == 0 then
        cmd = cmd .. " " .. params.args
      end
      require("lz.n").trigger_load("overseer.nvim")
      local task = require("overseer").new_task({
        cmd = vim.fn.expandcmd(cmd),
        components = {
          { "on_output_quickfix", open = not params.bang, open_height = 8 },
          "default",
        },
      })
      task:start()
    end, {
        desc = "Run your makeprg as an Overseer task",
        nargs = "*",
        bang = true,
      })
  end,
  after = function()
    require('overseer').setup({})
  end,
}
