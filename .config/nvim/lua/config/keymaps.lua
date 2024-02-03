-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Write file and quit
vim.keymap.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save & Quit" })

-- Wipe a buffer
vim.keymap.set("n", "<leader>w", "<cmd>bw<CR>", { desc = "Wipe buffer" })
