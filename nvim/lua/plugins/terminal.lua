return {
  {
    "LazyVim/LazyVim",
    opts = {
      defaults = {
        terminal = {
          split = "vsplit", -- opens terminal vertically
        },
      },
    },
  },
  -- Configure snacks.nvim terminal if you prefer using it
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        win = {
          position = "right", -- opens on the right side
          border = "rounded",
          width = 0.4, -- 40% of screen width (default is usually ~30%)
        },
      },
    },
  },
}