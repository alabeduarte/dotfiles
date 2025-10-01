return {
  {
    "ravitemer/mcphub.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup()
    end,
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal_cmd = "claude",
      track_selection = true,
      terminal = {
        split_side = "right",
        split_width_percentage = 0.60,
        auto_close = false,
      },
      diff_opts = {
        auto_close_on_accept = true,
        vertical_split = true,
        open_in_current_tab = true,
      },
    },
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    lazy = true,
    keys = {
      { "<leader>ap", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Code Companion Chat" },
      { "<leader>aP", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Code Companion Chat" },
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
        ["Generate a Custom Commit Cessage"] = {
          strategy = "chat",
          description = "Generate a custom commit message",
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
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          show_result_in_chat = true, -- Show mcp tool results in chat
          make_vars = true, -- Convert resources to #variables
          make_slash_commands = true, -- Add prompts as /slash commands
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
