-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Require custom functions
local custom_functions = require("dortes.core.custom-functions")

-- Map dd to the smart_dd_wrapper function
keymap.set("n", "dd", function()
  custom_functions.smart_dd_wrapper()
end, { noremap = true, silent = true })

keymap.set("n", "<leader>lp", function()
  vim.cmd('silent! normal! g`"zv')
end, { noremap = true, silent = true, desc = "Jump to last edited position" })
---------------------
-- Custom Keymaps for Deleting and Inserting Lines -------------------

-- Delete blank line below with <leader>mb
keymap.set(
  "n",
  "<leader>mb",
  [[:silent! m`:silent +g/\m^\s*$/d<CR>``:noh<CR>]],
  { noremap = true, silent = true, desc = "Delete blank line below" }
)

-- Delete blank line above with <leader>mt
keymap.set(
  "n",
  "<leader>mt",
  [[:silent! m`:silent -g/\m^\s*$/d<CR>``:noh<CR>]],
  { noremap = true, silent = true, desc = "Delete blank line above" }
)

-- Insert blank line below with <leader>mj
keymap.set(
  "n",
  "<leader>mj",
  [[:set paste<CR>m`o<Esc>``:set nopaste<CR>]],
  { noremap = true, silent = true, desc = "Insert blank line below" }
)

-- Insert blank line above with <leader>mk
keymap.set(
  "n",
  "<leader>mk",
  [[:set paste<CR>m`O<Esc>``:set nopaste<CR>]],
  { noremap = true, silent = true, desc = "Insert blank line above" }
)
