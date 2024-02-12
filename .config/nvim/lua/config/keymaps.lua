-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Write file and quit
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save & Quit" })

-- Write buffer, exit Neovim, run `git commit --verbose --all`
vim.api.nvim_set_keymap(
  "n",
  "<leader>gca",
  [[:w<bar>xa<bar>!git commit --verbose --all<CR>]],
  { noremap = true, silent = true, desc = "Commit to git" }
)

-- Wipe a buffer
vim.keymap.set("n", "<leader>w", "<cmd>bwipeout<CR>", { desc = "Wipe buffer" })

-- Insert empty lines above or below the current line
vim.keymap.set(
  "n",
  "<leader>[",
  "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>",
  { desc = "Add line above" }
)
vim.keymap.set(
  "n",
  "<leader>]",
  "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>",
  { desc = "Add line below" }
)
