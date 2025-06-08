return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      inline = {
        keymaps = {
          accept_change = {
            modes = { n = "<leader>a" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "<leader>r" },
            description = "Reject the suggested change",
          },
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
