return {
  "fatih/vim-go",
  build = ":GoUpdateBinaries",
  ft = { "go" },
  config = function()
    -- Optional: configure vim-go settings here
    vim.g.go_fmt_command = "goimports"
  end,
}
