-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.startify'

      dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
      }

      alpha.setup(dashboard.opts)
    end,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        view_options = {
          show_hidden = true,
        },
      }

      local oil = require 'oil'
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
      vim.keymap.set('n', '<leader>sh', oil.toggle_hidden, { desc = 'Open parent directory' })
    end,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-neotest/neotest-python',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-python',
        },
      }
      local neotest = require 'neotest'
      vim.keymap.set('n', '<leader>ts', neotest.summary.toggle, { desc = 'Neotest: View Tests in Directory' })
      vim.keymap.set('n', '<leader>tr', neotest.run.run, { desc = 'Neotest: Run test under cursor' })
      vim.keymap.set('n', '<leader>tf', function()
        neotest.run.run(vim.fn.expand '%')
      end, { desc = 'Neotest: Run all tests in file' })
      vim.keymap.set('n', '<leader>td', function()
        neotest.run.run { strategy = 'dap' }
      end, { desc = 'Neotest: Debug test under cursor' })
      vim.keymap.set('n', '<leader>to', neotest.output.open, { desc = 'Neotest: Float output of test panel' })
      vim.keymap.set('n', '<leader>tp', neotest.output_panel.open, { desc = 'Neotest: Ouput Panel' })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'dracula',
        },
        sections = {
          lualine_c = { { 'filename', path = 1 } },
        },
      }
    end,
  },
  {
    'akinsho/git-conflict.nvim',
    version = 'v2.0.0',
    config = function()
      require('git-conflict').setup {
        disable_diagnostics = true,
      }
    end,
  },
  {
    'kkoomen/vim-doge',
    config = function()
      -- Configure vim-doge
      vim.cmd [[
		    let g:doge_enable = 1
		    let g:doge_doc_standard_python = 'numpy'
		    let g:doge_mapping = '<leader>o'

		  ]]
      -- Optionally, set up a key mapping for generating docstrings
      vim.keymap.set('n', '<leader>o', ':DogeGenerate<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
}
