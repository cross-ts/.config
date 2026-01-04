-- A task runner and job management plugin for Neovim
---@type LazyPluginSpec
return {
  'stevearc/overseer.nvim',
  cmd = {
    'Make',
    'OverseerToggle',
    'OverseerRun',
  },
  keys = {
    { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle Overseer" },
    { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run Overseer Task" },
  },
  init = function()
    vim.api.nvim_create_user_command("Make", function(params)
      -- Insert args at the '$*' in the makeprg
      local cmd, num_subs = vim.o.makeprg:gsub("%$%*", params.args)
      if num_subs == 0 then
        cmd = cmd .. " " .. params.args
      end
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
  opts = {},
}
