-- Configure packer
require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'Mofiqul/adwaita.nvim'
    use {
        'nvim-treesitter/nvim-treesitter', tag = 'v0.9.2',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            local dashboard = require('alpha.themes.dashboard')

            math.randomseed(os.time())

            local function meme()
                local memes = { 'bóbr', 'poczekaj', 'ratatuj', 'pingwin', 'panda', 'homik', 'jeżek', 'skunks', 'užik', 'jeleń' }
                return memes[math.random(#memes)]
            end

            dashboard.section.header.val = {
                [[                      _           ]],
                [[                     (_)          ]],
                [[ _ __   ___    __   ___ _ __ ___  ]],
                [[| '_ \ / _ \   \ \ / / | '_ ` _ \ ]],
                [[| | | | (_) |   \ V /| | | | | | |]],
                [[|_| |_|\___( )   \_/ |_|_| |_| |_|]],
                [[           |/                     ]]
            }
            dashboard.section.buttons.val = {
                dashboard.button('n', 'new', '<cmd>ene <CR>'),
                dashboard.button('r', 'recent', ":Telescope oldfiles<CR>"),
                dashboard.button('q', 'quit', ':qa<CR>'),
            }
            dashboard.section.footer.val = { meme() }
            require('alpha').setup(dashboard.opts)
        end
    }
end)

-- TreeSitter config
require'nvim-treesitter.configs'.setup {
  build = ':TSUpdate',
  ensure_installed = {
    "markdown",
    "vim",
    "vimdoc",
    "bash",
    "lua",
    "go",
    "gomod",
    "gosum",
    "proto",
    "dockerfile",
    "javascript",
    "typescript",
    "html",
    "json",
    "yaml"
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}

-- Set charsets
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Set the window properties like row nums and title bar
vim.opt.number = true
vim.opt.showmode = false
-- Use global clipboard shared with X or Wayland
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.breakindent = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Serach config
vim.opt.hlsearch = true
vim.opt.ignorecase = true

-- Configure indent
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Tab and backspace
vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.scrolloff = 5
vim.opt.backspace = { "indent", "eol", "start" }

-- Keybinds
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, desc = '[F]ind [F]files' })
vim.api.nvim_set_keymap('n', '<leader>gc', ':Telescope git_commits<CR>', { noremap = true, desc = '[G]it [C]ommits' })
vim.api.nvim_set_keymap('n', '<leader>gb', ':Telescope git_branches<CR>', { noremap = true, desc = '[G]it [B]ranches' })
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, desc = '[F]ind' })
vim.api.nvim_set_keymap('n', '<leader>gh', ':Gitsigns toggle_current_line_blame<CR>', { noremap = true, desc = '[G]it [H]istory' })
vim.api.nvim_set_keymap('n', '<leader>tt', ':sp term://bash<CR>', { noremap = true, desc = '[TT]erminal' })
vim.api.nvim_set_keymap('n', '<leader>sk', ":Telescope keymaps<CR>", { noremap = true, desc = '[S]earch [K]eymaps' })

-- Set color scheme
vim.cmd[[colorscheme adwaita]]
vim.opt.termguicolors = true

-- Set status bar
require('lualine').setup()

-- vim: ts=2 sts=2 sw=2 et
