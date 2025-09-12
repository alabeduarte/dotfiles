return {
  "fatih/vim-go",
  build = ":GoUpdateBinaries",
  ft = { "go", "gomod", "gowork", "gotmpl" },
  lazy = true,
  config = function()
    -- Optional: configure vim-go settings here
    vim.g.go_fmt_command = "goimports"
  end,
  keys = {
    { "<leader>d", ":GoDecls<CR>", mode = "n", desc = "Go declarations", { noremap = true, silent = true } },
    { "<C-\\>", ":GoImplements<CR>", mode = "n", desc = "Go implementations", { noremap = true, silent = true } },
  },
}
