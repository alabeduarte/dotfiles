return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      kotlin_language_server = {
        init_options = {
          storagePath = vim.fn.stdpath("cache") .. "/kotlin_language_server",
        },
      },
    },
  },
}
