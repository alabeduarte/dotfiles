local function resize_claude_terminal(percentage)
  local claudecode_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_type = vim.bo[buf].buftype
    local buf_filetype = vim.bo[buf].filetype
    if buf_type == "terminal" and buf_filetype == "snacks_terminal" then
      claudecode_win = win
      break
    end
  end

  if claudecode_win then
    local width
    if percentage == 1.0 then
      width = vim.o.columns
    else
      width = math.floor(vim.o.columns * percentage)
    end
    vim.api.nvim_win_set_width(claudecode_win, width)
    print(string.format("Claude terminal resized to %d%%", percentage * 100))
  else
    print("ClaudeCode terminal window not found")
  end
end

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
    "sourcegraph/amp.nvim",
    branch = "main",
    lazy = false,
    config = function(_, opts)
      require("amp").setup(opts)

      vim.api.nvim_create_user_command("AmpSendMessage", function()
        vim.ui.input({ prompt = "Message: " }, function(input)
          if input then
            require("amp").send_message(input)
          end
        end)
      end, { desc = "Send a message to Amp" })

      vim.api.nvim_create_user_command("AmpSendBuffer", function()
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        require("amp").send_message(table.concat(lines, "\n"))
      end, { desc = "Send current buffer to Amp" })
    end,
    opts = { auto_start = true, log_level = "info" },
    keys = {
      { "<leader>am", "<cmd>AmpSendMessage<cr>", desc = "Send message to Amp" },
      { "<leader>aB", "<cmd>AmpSendBuffer<cr>", desc = "Send buffer to Amp" },
    },
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function(_, opts)
      require("claudecode").setup(opts)

      vim.api.nvim_create_user_command("ClaudeResize", function(args)
        local size = args.args:lower()
        if size == "default" then
          resize_claude_terminal(0.60)
        elseif size == "full" then
          resize_claude_terminal(1.0)
        elseif size == "small" then
          resize_claude_terminal(0.30)
        else
          print("Usage: :ClaudeResize [default|full|small]")
        end
      end, {
        nargs = 1,
        complete = function()
          return { "default", "full", "small" }
        end,
        desc = "Resize ClaudeCode terminal window",
      })
    end,
    opts = {
      --terminal_cmd = "gemini",
      terminal_cmd = "bash -c 'rm -rf ~/.nvm/versions/node/*/lib/node_modules/@anthropic-ai/claude-code; npm i -g @anthropic-ai/claude-code; claude'",
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
      -- Terminal resize
      {
        "<leader>a0",
        function()
          resize_claude_terminal(0.60)
        end,
        desc = "Claude terminal: default width (60%)",
      },
      {
        "<leader>aF",
        function()
          resize_claude_terminal(1.0)
        end,
        desc = "Claude terminal: full width (100%)",
      },
      {
        "<leader>a3",
        function()
          resize_claude_terminal(0.30)
        end,
        desc = "Claude terminal: small width (30%)",
      },
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
