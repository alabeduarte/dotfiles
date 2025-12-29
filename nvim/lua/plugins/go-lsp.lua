return {
  {
    "neovim/nvim-lspconfig",
    ft = { "go", "gomod", "gowork" },
    opts = {
      servers = {
        gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = false,
              compositeLiteralFields = false,
              compositeLiteralTypes = false,
              constantValues = false,
              functionTypeParameters = false,
              parameterNames = false,
              rangeVariableTypes = false,
            },
          },
        },
      },
    },
  },
}
}
