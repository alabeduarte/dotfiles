return {
  -- Additional TypeScript-specific configurations
  {
    "neovim/nvim-lspconfig",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
        },
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },
      },
    },
  },
  -- Auto-install tools via Mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint_d",
      },
    },
  },
  -- Configure conform.nvim to respect project ESLint configs
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      },
      formatters = {
        eslint_d = {
          condition = function(ctx)
            return vim.fs.find(
              { ".eslintrc.js", ".eslintrc.json", ".eslintrc.yml", ".eslintrc.yaml", "eslint.config.js" },
              { path = ctx.filename, upward = true }
            )[1]
          end,
        },
      },
    },
  },
}

