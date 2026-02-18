require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

map("n", "<A-Up>", "<C-w>k", { desc = "Window Up" })
map("n", "<A-Down>", "<C-w>j", { desc = "Window Down" })
map("n", "<A-Left>", "<C-w>h", { desc = "Window Left" })
map("n", "<A-Right>", "<C-w>l", { desc = "Window Right" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
