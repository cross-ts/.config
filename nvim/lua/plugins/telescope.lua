-- Find, Filter, Preview, Pick. All lua, all the time.
---@type configs.PluginSpec
return {
  'telescope.nvim',
  src = 'https://github.com/nvim-telescope/telescope.nvim',
  cmd = { 'Telescope' },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', { silent = true } },
    {
      '<leader>fg',
      function()
        require('telescope.builtin').grep_string {
          shorten_path = true,
          path_display = { 'hidden' },
          word_match = '-w',
          only_sort_text = true,
          search = '',
        }
      end,
      { silent = true },
    },
    {
      '<leader>gg',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find {
          skip_empty_lines = true,
          results_ts_highlight = true,
        }
      end,
      { silent = true },
    },
    {
      '<leader>fb',
      function()
        require('telescope').extensions.file_browser.file_browser()
      end,
      { silent = true },
    },
    { '<leader>fr', '<cmd>Telescope frecency workspace=CWD path_display={"shorten"}<cr>', { silent = true } },
  },
  after = function()
    -- extension は telescope を require するため telescope のロード後に読み込む
    require('lz.n').trigger_load({
      'telescope-file-browser.nvim',
      'telescope-frecency.nvim',
      'telescope-fzf-native.nvim',
    })

    local telescope = require('telescope')
    telescope.setup {
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '--glob', '!**/.git/*',
        },
      },
      pickers = {
        find_files = {
          find_command = { 'fd', '--hidden' },
        },
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
          auto_depth = true,
          hidden = {
            file_browser = true,
            folder_browser = true,
          },
          git_status = false,
          hide_parent_dir = true,
        },
        frecency = {
          matcher = "fuzzy",
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      }
    }
    telescope.load_extension('file_browser')
    telescope.load_extension('frecency')
    telescope.load_extension('fzf')
  end,
}
