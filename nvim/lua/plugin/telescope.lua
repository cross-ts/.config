-- Find, Filter, Preview, Pick. All lua, all the time.
return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-frecency.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  cmd = { 'Telescope' },
  config = function()
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
          find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
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
  keys = function()
    return {
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
    }
  end,
}
