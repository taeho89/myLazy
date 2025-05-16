-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim-tmux navigator
vim.keymap.set("n", "<C-h>", ":NvimTmuxNavigateLeft<CR>", { desc = "NvimTmuxNavigateLeft", silent = true })
vim.keymap.set("n", "<C-j>", ":NvimTmuxNavigateDown<CR>", { desc = "NvimTmuxNavigateDown", silent = true })
vim.keymap.set("n", "<C-k>", ":NvimTmuxNavigateUp<CR>", { desc = "NvimTmuxNavigateUp", silent = true })
vim.keymap.set("n", "<C-l>", ":NvimTmuxNavigateRight<CR>", { desc = "NvimTmuxNavigateRight", silent = true })
vim.keymap.set("n", "<F4>", ":highlight clear cursorline<cr>", { desc ="Clear cursorline highlight", silent = true })


-- comment.lua
