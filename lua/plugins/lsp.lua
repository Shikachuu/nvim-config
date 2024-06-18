return {
  "b0o/schemastore.nvim",
  {
    "williamboman/mason.nvim",
    config = function() require('mason').setup() end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      lsp_capabilities.textDocument.foldingRandge = { dynamicRegistration = true }
      local settings = {}
      local default_setup = function(server)
        if server == "gopls" then
          settings = {
            gopls = {
              analyses = {
                useany = true,
                unusedvariable = true,
              },
              staticcheck = true,
            },
          }
        end

        if server == "jsonls" then
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
            },
          }
        end

        if server == "yamlls" then
          settings = {
            yaml = {
              schemaStore = {
                -- disable the built-in schemaStore support
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
              },
              schemas = require('schemastore').yaml.schemas(),
            },
          }
        end

        require('lspconfig')[server].setup({
          capabilities = lsp_capabilities,
          settings = settings,
          handlers = {
            ["textDocument/foldingRange"] = function(_, _, result)
              if not result then return end
              vim.lsp.util.set_fold(result)
            end
          }
        })
      end

      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "lua_ls", "jsonls", "yamlls" },
        handlers = { default_setup }
      })
    end,

  },
  "neovim/nvim-lspconfig",
  { "folke/neodev.nvim", opts = { lspconfig = true, pathStrict = true, enabled = true } }
}
-- vim: ts=2 sts=2 sw=2 et
