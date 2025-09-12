return {
  "fatih/vim-go",
  build = ":GoUpdateBinaries",
  ft = { "go" },
  config = function()
    -- Optional: configure vim-go settings here
    vim.g.go_fmt_command = "goimports"
  end,
  keys = {
    { "<leader>d", ":GoDecls<CR>", mode = "n", { noremap = true, silent = true } },
    { "<C-\\>", ":GoImplements<CR>", mode = "n", { noremap = true, silent = true } },
  },
}
