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

-- Quickfix close
--map("n", "<leader>a", ":cclose<CR>:lclose<CR>", opts)

-- Vimux commands
--map("n", "<leader>vp", ":VimuxPromptCommand<CR>", opts)
--map("n", "<leader>rl", ":VimuxRunLastCommand<CR>", opts)

-- Syntax re-sync
-- map("n", "<leader>s", ":syntax sync fromstart<CR>", opts)

-- Auto-format
--map("n", "<leader>f", "<Plug>(coc-format-selected)", opts)

-- Go-specific navigation
-- map("n", "<leader>d", ":GoDecls<CR>", opts)
-- map("n", "<C-\\>", ":GoImplements<CR>", opts)
-- map("n", "<leader>g", ":ALEGoToDefinition<CR>", opts)

-- FZF file search
-- map("n", "<C-p>", ":Files<CR>", opts)

-- AG content search
--map("n", "\\", ":Ag<SPACE>", opts)
