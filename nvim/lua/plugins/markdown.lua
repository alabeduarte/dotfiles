local md_config = vim.fn.stdpath("config") .. "/.markdownlint.jsonc"

return {
  {
    "mfussenegger/nvim-lint",
    init = function()
      local lint = require("lint")
      lint.linters["markdownlint-cli2"] = vim.tbl_deep_extend("force", lint.linters["markdownlint-cli2"], {
        args = { "-", "--config", md_config },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        ["markdownlint-cli2"] = {
          args = { "--fix", "--config", md_config, "$FILENAME" },
        },
      },
    },
  },
}
