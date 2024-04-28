-- Configure packer
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/adwaita.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.9.2',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function()
      require('nvim-treesitter.configs').setup {
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
    end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('lualine').setup() end,
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end,
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
    end,
  }
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_enabled = true,
        auto_session_create_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
      }
    end,
  }
  use {
    "williamboman/mason.nvim",
    config = function() require('mason').setup() end,
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

      local default_setup = function(server)
        require('lspconfig')[server].setup({
          capabilities = lsp_capabilities,
        })
      end

      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "lua_ls" },
        handlers = { default_setup }
      })
    end,

  }
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use {
    "L3MON4D3/LuaSnip",
    tag = "v2.*",
  }
  use {
    "hrsh7th/nvim-cmp",
    requires = { "neovim/nvim-lspconfig" },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
        sources = {
          { name = 'nvim_lsp' },
        },
        mapping = cmp.mapping.preset.insert({
          -- Enter key confirms completion item
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          -- Ctrl + space triggers completion menu
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
      })
    end,
  }
  use "github/copilot.vim"
end)

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
vim.api.nvim_set_keymap('n', '<leader>fs', ':Telescope grep_string<CR>', { noremap = true, desc = '[f]ind [s]tring' })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, desc = '[f]ind [f]iles' })
vim.api.nvim_set_keymap('n', '<leader>Gc', ':Telescope git_commits<CR>', { noremap = true, desc = '[G]it [c]ommits' })
vim.api.nvim_set_keymap('n', '<leader>Gb', ':Telescope git_branches<CR>', { noremap = true, desc = '[G]it [b]ranches' })
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, desc = '[F]ind' })
vim.api.nvim_set_keymap('n', '<leader>Gh', ':Gitsigns toggle_current_line_blame<CR>',
  { noremap = true, desc = '[G]it [h]istory' })
vim.api.nvim_set_keymap('n', '<leader>tt', ':sp term://bash<CR>', { noremap = true, desc = '[tt]erminal' })
vim.api.nvim_set_keymap('n', '<leader>sk', ":Telescope keymaps<CR>", { noremap = true, desc = '[s]earch [k]eymaps' })

-- Set color scheme
vim.cmd [[colorscheme adwaita]]
vim.opt.termguicolors = true

-- Auto Commands
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buf })
    vim.keymap.set('n', '<leader>gd', require('telescope.builtin').lsp_definitions,
      { buffer = event.buf, desc = '[g]oto [d]efinitions' })
    vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
      { buffer = event.buf, desc = '[g]oto [i]mplementations' })
    vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references,
      { buffer = event.buf, desc = '[g]oto [r]eferences' })
    vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, { buffer = event.buf, desc = '[s]ignature [h]elp' })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = event.buf, desc = '[r]e[n]ame' })
    vim.keymap.set({ 'n', 'x' }, '<C-A-l>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
      { buffer = event.buf, desc = 'Format [C-A-l]' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = '[c]ode [a]actions' })
    vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
      { buffer = event.buf, desc = '[w]orkspace [s]ymbols' })
  end
})

-- vim: ts=2 sts=2 sw=2 et
