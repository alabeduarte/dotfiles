return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim", -- optional - for diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
    opts = {
      -- Disable commit confirmation prompt
      disable_commit_confirmation = false,
      -- Automatically show console output
      console_timeout = 2000,
      -- Automatically refresh on certain events
      auto_refresh = true,
      -- Sort branches/tags by recency
      sort_branches = "-committerdate",
      -- Remember settings from previous session
      remember_settings = true,
      -- Use vertical splits when opening files
      use_per_project_settings = true,
      -- Commit editor settings
      commit_editor = {
        kind = "tab",
        show_staged_diff = true,
        -- Spell check
        spell_check = true,
      },
      -- Status buffer appearance
      status = {
        recent_commit_count = 10,
      },
      -- Signs in the gutter
      signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
      -- Integration with other plugins
      integrations = {
        telescope = true,
        diffview = true,
      },
    },
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit Status" },
      { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Git Commit" },
      { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Git Push" },
      { "<leader>gP", "<cmd>Neogit pull<cr>", desc = "Git Pull" },
      { "<leader>gb", "<cmd>Neogit branch<cr>", desc = "Git Branch" },
      { "<leader>gl", "<cmd>Neogit log<cr>", desc = "Git Log" },
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
    },
  },
}