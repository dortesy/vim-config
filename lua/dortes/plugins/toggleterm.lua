return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  config = function()
    require("toggleterm").setup({
      -- Any additional setup options you need
      size = 20, -- default size for horizontal terminals
      open_mapping = [[<C-\>]],
      direction = "horizontal",
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
    })

    local keymap = vim.keymap -- for conciseness

    -- Key mappings for normal mode to open different terminals
    keymap.set("n", "<leader>t1", "<cmd>1ToggleTerm direction=horizontal<cr>", { desc = "Toggle Terminal 1" })
    keymap.set("n", "<leader>t2", "<cmd>2ToggleTerm direction=horizontal<cr>", { desc = "Toggle Terminal 2" })
    keymap.set("n", "<leader>t3", "<cmd>3ToggleTerm direction=horizontal<cr>", { desc = "Toggle Terminal 3" })

    -- Key mappings for normal mode to open floating terminals
    keymap.set("n", "<leader>f1", "<cmd>1ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal 1" })
    keymap.set("n", "<leader>f2", "<cmd>2ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal 2" })
    keymap.set("n", "<leader>f3", "<cmd>3ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal 3" })

    -- Key mappings for terminal mode to exit and toggle specific terminals
    keymap.set(
      "t",
      "<C-\\><C-1>",
      [[<C-\><C-n><cmd>1ToggleTerm<cr>]],
      { desc = "Toggle Terminal 1", noremap = true, silent = true }
    )
    keymap.set(
      "t",
      "<C-\\><C-2>",
      [[<C-\><C-n><cmd>2ToggleTerm<cr>]],
      { desc = "Toggle Terminal 2", noremap = true, silent = true }
    )
    keymap.set(
      "t",
      "<C-\\><C-3>",
      [[<C-\><C-n><cmd>3ToggleTerm<cr>]],
      { desc = "Toggle Terminal 3", noremap = true, silent = true }
    )

    keymap.set("t", "<leader>t1", "<cmd>1ToggleTerm<cr>", { desc = "Toggle Terminal 1", noremap = true, silent = true })
    keymap.set("t", "<leader>t2", "<cmd>2ToggleTerm<cr>", { desc = "Toggle Terminal 2", noremap = true, silent = true })
    keymap.set("t", "<leader>t3", "<cmd>3ToggleTerm<cr>", { desc = "Toggle Terminal 3", noremap = true, silent = true })
    -- Example of a custom terminal
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
  end,
}
