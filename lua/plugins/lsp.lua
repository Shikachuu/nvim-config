return {
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
  { "folke/neodev.nvim", opts = { lspconfig = true, pathStrict = true, enabled = true } }
}
-- vim: ts=2 sts=2 sw=2 et
