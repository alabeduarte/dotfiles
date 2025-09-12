-- Temporary workaround for catppuccin bufferline integration
-- This fixes the error: "attempt to call field 'get' (a nil value)"
-- Can be removed once https://github.com/LazyVim/LazyVim/pull/6354 is merged
return {
  {
    "akinsho/bufferline.nvim",
    init = function()
      local bufline = require("catppuccin.groups.integrations.bufferline")
      function bufline.get()
        return bufline.get_theme()
      end
    end,
  },
}