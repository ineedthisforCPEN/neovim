local builtin = require("telescope.builtin")
-- Each mapping attempts to be a shorthand for what you want to do
--      pb  List Buffers    List opened buffers
--      pc  List Commands   List command history for the current session.
--      pf  Project Files   Search for a file in the current project
--      pg  Project Grep    Grep for a string in the current project
--      pG  Project Grep    Grep for the current string in the current project

vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>pc", builtin.command_history, {})
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pG", builtin.grep_string, {})

