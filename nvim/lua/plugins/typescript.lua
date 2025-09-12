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
      },
    },
  },
}