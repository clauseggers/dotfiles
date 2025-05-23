-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Search keymaps by <leader>sk

-- Add any additional keymaps below

-- Spell checking uses the following shortcuts
-- Enable/disable spell checking is `<leader>us`
-- Go to the next spelling error `]s`
-- Go to the previous spelling error `[s`
-- Mark word as good `zg`
-- Show suggestions `z=`

-- Write the buffer to disk
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Write the buffer" })

-- Write file and quit
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save & Quit" })
vim.keymap.set("n", "zz", "<cmd>wq<CR>", { desc = "Save & Quit" })

-- Quit without saving
vim.keymap.set("n", "qq", "<cmd>q!<CR>", { desc = "Quit without saving" })

-- Delete a buffer
vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

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

-- Delete all marks
vim.keymap.set("n", "<leader>dm", "<cmd>delm!<CR>", { desc = "Delete marks" })

-- Keymaps for Gen.nvim
vim.keymap.set({ "n", "v" }, "<leader>l", ":Gen<CR>")
