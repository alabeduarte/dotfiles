return {
  "olimorris/codecompanion.nvim",
  lazy = true,
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Code Companion Chat" },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Code Companion Chat" },
    { "<C-p>", ":CodeCompanion<CR>", mode = { "n", "v" }, desc = "Trigger CodeCompanion prompt" },
  },
  opts = {
    strategies = {
      chat = {
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4",
        },
        opts = {
          goto_file_action = "tabnew",
        },
        keymaps = {
          send = {
            callback = function(chat)
              vim.cmd("stopinsert")
              chat:submit()
              chat:add_buf_message({ role = "llm", content = "" })
            end,
            index = 1,
            description = "Send",
          },
        },
        variables = {
          ["project"] = {
            ---@return string
            callback = "CLAUDE.md",
            description = "Claude project information",
            opts = {
              contains_code = true,
            },
          },
        },
      },
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
                [[You are an expert at following the Conventional Commit specification (clear, structured and informative). Avoid using feat, fix, chore, etc and wrap any function/variable/struct with ``. Given the git diff listed below, please generate a commit message for me:

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
