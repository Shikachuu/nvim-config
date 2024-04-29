-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Add dependencies
require('lazy').setup({
  'wbthomason/packer.nvim',
  'Mofiqul/adwaita.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    tag = 'v0.9.2',
    build = ':TSUpdate',
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
          "yaml",
        },
        sync_install = true,
        auto_install = true,
        highlight = {
          -- `false` will disable the whole extension
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>", -- set to `false` to disable one of the mappings
            node_incremental = "<CR>",
            scope_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
          }
        }
      }
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      require('refactoring').setup()
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require('lualine').setup() end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end,
  },
  {
    'echasnovski/mini.tabline',
    config = function()
      require('mini.tabline').setup({ show_icons = true, set_vim_settings = true })
    end
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
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
  },
  {
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
  },
  {
    'echasnovski/mini.pairs',
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
    "williamboman/mason.nvim",
    config = function() require('mason').setup() end,
  },
  {
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

  },
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "neovim/nvim-lspconfig" },
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
  },
  { "github/copilot.vim" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup()
    end,
  }
})

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
local Job = require('plenary.job')

local function git_commit()
  local message = vim.fn.input('Type commit message and press Enter: ')
  Job:new({
    command = 'git',
    args = { 'add', '-A' },
    on_exit = function()
      Job:new({
        command = 'git',
        args = { 'commit', '-s', '-m', message },
        on_exit = function(j, exit_code)
          if exit_code == 0 then
            vim.notify('Committed with message: ' .. message, 'info', { title = 'Git' })
          else
            vim.notify('Failed to commit, exit code:' .. exit_code, 'error', { title = 'Git' })
          end
        end,
      }):start()
    end,
  }):start()
end

local function git_push()
  Job:new({
    command = 'git',
    args = { 'push' },
    on_exit = function(j, exit_code)
      if exit_code == 0 then
        vim.notify('Pushed to remote', 'info', { title = 'Git' })
      else
        vim.notify('Failed to push to remote, exit code:' .. exit_code, 'error', { title = 'Git' })
      end
    end,
  }):start()
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('n', '<leader>fs', ':Telescope grep_string<CR>', { noremap = true, desc = '[f]ind [s]tring' })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, desc = '[f]ind [f]iles' })
vim.api.nvim_set_keymap('n', '<leader>Gcs', ':Telescope git_commits<CR>', { noremap = true, desc = '[G]it [c]ommits' })
vim.api.nvim_set_keymap('n', '<leader>Gb', ':Telescope git_branches<CR>', { noremap = true, desc = '[G]it [b]ranches' })
vim.keymap.set('n', '<leader>Gp', git_push, { noremap = true, desc = '[G]it [p]ush' })
vim.api.nvim_set_keymap('n', '<leader>Gh', ':Gitsigns toggle_current_line_blame<CR>',
  { noremap = true, desc = '[G]it [h]istory' })
vim.keymap.set('n', '<leader>Gc', git_commit, { noremap = true, silent = true, desc = '[g]it [c]ommit' })
vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, desc = '[F]ind' })
vim.api.nvim_set_keymap('n', '<leader>tt', ':sp term://bash<CR>', { noremap = true, desc = '[tt]erminal' })
vim.api.nvim_set_keymap('n', '<leader>sk', ":Telescope keymaps<CR>", { noremap = true, desc = '[s]earch [k]eymaps' })
vim.api.nvim_set_keymap('n', '<leader><TAB>', ":Telescope buffers<CR>", { noremap = true, desc = 'show open buffers' })
vim.keymap.set('x', '<leader>es', ':Refactor extract<CR>', { noremap = true, desc = '[e]xtract [s]cope' })
vim.keymap.set('x', '<leader>ev', ':Refactor extract_var<CR>', { noremap = true, desc = '[e]xtract [v]ariable' })
vim.keymap.set({ 'n', 'x' }, '<leader>iv', ':Refactor inline_var<CR>', { noremap = true, desc = '[i]line [v]ariable' })
vim.keymap.set('n', '<C-S-Up>', ':m -2<CR>', { noremap = true, desc = 'move line up', silent = true })
vim.keymap.set('n', '<C-S-Down>', ':m +1<CR>', { noremap = true, desc = 'move line down', silent = true })
vim.keymap.set('n', '<leader>spv', ':vsplit<CR>', { noremap = true, desc = '[s][p]lit [v]ertical', silent = true })
vim.keymap.set('n', '<leader>sph', ':split<CR>', { noremap = true, desc = '[s][p]lit [h]orizontal', silent = true })


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
