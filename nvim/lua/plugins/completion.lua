return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    -- keep only the sources you want
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp" }, -- language server
      { name = "luasnip" }, -- snippets
      { name = "path" }, -- file paths
      -- { name = "buffer" },  -- disable buffer completions (words in comments/strings)
    })

    return opts
  end,
}
