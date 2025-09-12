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
    prompt_library = {
      ["Generate a Commit Message"] = {
        strategy = "chat",
        description = "Generate a commit message",
        opts = {
          index = 10,
          is_default = true,
          is_slash_cmd = true,
          short_name = "commit",
          auto_submit = true,
        },
        prompts = {
          {
            role = "user",
            content = function()
              return string.format(
                [[You are an expert at following the Conventional Commit specification. However, the commit message should not use feat/chore/refactor, I want a single sentence. Also, wrap any function/variable/struct with ``. Given the git diff listed below, please generate a commit message for me:

                  ```diff
                    %s
                  ```
                ]],
                vim.fn.system("git diff --no-ext-diff --staged")
              )
            end,
            opts = {
              contains_code = true,
            },
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
