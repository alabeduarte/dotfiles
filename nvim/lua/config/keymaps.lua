-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clipboard settings
map("n", "<leader>y", '"*y', opts)
map("n", "<leader>p", '"*p', opts)
map("n", "<leader>Y", '"+y', opts)
map("n", "<leader>P", '"+p', opts)

-- Markdown
vim.keymap.set("i", "<C-l>", "```<CR><CR>```<Esc>kA", { desc = "Insert markdown code block" })

-- LSP
vim.keymap.set("i", "<C-Space>", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-x><C-o>", true, true, true), "n")
end, { desc = "Trigger code completion" })

-- Quickfix close
--map("n", "<leader>a", ":cclose<CR>:lclose<CR>", opts)

-- Syntax re-sync
-- map("n", "<leader>s", ":syntax sync fromstart<CR>", opts)

-- Auto-format
--map("n", "<leader>f", "<Plug>(coc-format-selected)", opts)

-- FZF file search
-- map("n", "<C-p>", ":Files<CR>", opts)

-- AG content search
--map("n", "\\", ":Ag<SPACE>", opts)
