-- Open file explorer ("project view").
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Terminal emulator.
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")     -- Leave terminal with ESC.

-- LSP Diagnostics.
vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Working with buffers, tabs, an windows.
vim.keymap.set("n", "<leader>bb", ":enew<CR>")
vim.keymap.set("n", "<leader>q", ":bd<CR>")
vim.keymap.set("n", "<leader>Q", ":bd!<CR>")

-- Move selected text up and down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigation.
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Jump down half a page.
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Jump up half a page.
vim.keymap.set("n", "n", "nzzzv")       -- Keep search term in middle.
vim.keymap.set("n", "N", "Nzzzv")       -- Keep search term in middle.

-- Copying, moving, and pasting data.
vim.keymap.set("x", "<leader>p", "\"_dP")       -- Preserve copy buffer on paste.
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y") -- Copy to system clipboard.
vim.keymap.set("n", "<leader>Y", "\"+Y")        -- Copy to system clipboard.

