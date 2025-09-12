return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      files = {
        actions = {
          ["ctrl-h"] = function()
            require("fzf-lua").files({ hidden = true })
          end,
          ["ctrl-g"] = function()
            require("fzf-lua").files({ no_ignore = true })
          end,
        },
      },
      lsp = {
        symbols = {
          winopts = {
            width = 0.8,    -- 80% of screen width
            height = 0.7,   -- 70% of screen height
            preview = {
              layout = "horizontal",
              horizontal = "right:50%",
            },
          },
        },
      },
      winopts = {
        width = 0.8,      -- Default width for all fzf-lua windows
        height = 0.7,     -- Default height for all fzf-lua windows
      },
    },
  },
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
