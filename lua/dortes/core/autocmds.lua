-- Define the autocommand group
local misc_augroup = vim.api.nvim_create_augroup("misc_augroup", { clear = true })

-- Create the autocommand
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Open file at the last position it was edited earlier",
  group = misc_augroup,
  pattern = "*",
  command = 'silent! normal! g`"zv',
})
