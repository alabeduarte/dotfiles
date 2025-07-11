return {
  "preservim/vimux",
  config = function()
    vim.keymap.set(
      "n",
      "<leader>vp",
      ":VimuxPromptCommand<CR>",
      { noremap = true, silent = true, desc = "Vimux Prompt Command" }
    )
    vim.keymap.set(
      "n",
      "<leader>rl",
      ":VimuxRunLastCommand<CR>",
      { noremap = true, silent = true, desc = "Vimux Run Last Command" }
    )
  end,
  event = "VeryLazy",
}
