return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<C-h>"] = {
              "toggle_hidden",
              mode = { "i", "n" },
              desc = "Toggle hidden files",
            },
            ["<C-g>"] = {
              "toggle_ignored",
              mode = { "i", "n" },
              desc = "Toggle git ignored files",
            },
          },
        },
      },
    },
  },
}
