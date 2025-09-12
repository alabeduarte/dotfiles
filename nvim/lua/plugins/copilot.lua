return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_filetypes = {
      ["*"] = false,
      ["js"] = true,
      ["typescript"] = true,
      ["go"] = true,
      ["sql"] = true,
      ["shellscript"] = true,
      ["markdown"] = true,
      ["proto"] = true,
      ["sh"] = true,
    }
  end,
}
