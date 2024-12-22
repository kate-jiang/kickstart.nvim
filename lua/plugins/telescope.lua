return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('telescope').setup {
      defaults = {
        theme = 'ivy',
        file_ignore_patterns = { '%.DS_Store', '%.git/', 'node_modules' },
        mappings = {
          i = {
            ['<C-j>'] = 'move_selection_next',
            ['<C-k>'] = 'move_selection_previous',
          },
        },
      },
      pickers = {
        find_files = {
          theme = 'dropdown',
          previewer = false,
        },
        help_tags = {
          theme = 'ivy',
          previewer = true,
        },
        keymaps = {
          theme = 'ivy',
        },
        live_grep = {
          theme = 'ivy',
          previewer = true,
        },
        grep_string = {
          theme = 'ivy',
          previewer = true,
        },
        buffers = {
          theme = 'ivy',
          previewer = true,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'
    local map = vim.keymap.set

    map('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    map('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    map('n', '<C-p>', builtin.find_files, { desc = 'Search files' })
    map('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    map('n', '<leader>fw', builtin.grep_string, { desc = 'Find Word' })
    map('n', '<leader>F', builtin.live_grep, { desc = '[F]ind with grep' })
    map('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    map('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    map('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    map('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = 'Fuzzy search current buffer' })

    map('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    map('n', '<leader>sn', function()
      builtin.live_grep { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
