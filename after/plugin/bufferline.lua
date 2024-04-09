local bufferline = require("bufferline")
local opts = { silent = true }

-- Key remappings specific to the bufferline plugin.
vim.keymap.set("n", "<leader>1", function() bufferline.go_to(1, true) end, opts)
vim.keymap.set("n", "<leader>2", function() bufferline.go_to(2, true) end, opts)
vim.keymap.set("n", "<leader>3", function() bufferline.go_to(3, true) end, opts)
vim.keymap.set("n", "<leader>4", function() bufferline.go_to(4, true) end, opts)
vim.keymap.set("n", "<leader>5", function() bufferline.go_to(5, true) end, opts)
vim.keymap.set("n", "<leader>6", function() bufferline.go_to(6, true) end, opts)
vim.keymap.set("n", "<leader>7", function() bufferline.go_to(7, true) end, opts)
vim.keymap.set("n", "<leader>8", function() bufferline.go_to(8, true) end, opts)
vim.keymap.set("n", "<leader>9", function() bufferline.go_to(9, true) end, opts)
vim.keymap.set("n", "<leader>0", function() bufferline.go_to(-1, true) end, opts)

vim.keymap.set("n", "[b", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "]b", ":BufferLineCycleNext<CR>", opts)

vim.keymap.set("n", "[B", ":BufferLineMovePrev<CR>", opts)
vim.keymap.set("n", "]B", ":BufferLineMoveNext<CR>", opts)

bufferline.setup({
    options = {
        color_icons = true,
        diagnostics = "nvim_ls",

        style_preset = {
            bufferline.style_preset.no_italic,
        },

        -- Allow the mouse to perform bufferline actions.
        close_command = "bdelete! %d",

        left_mouse_command = "buffer! %d",      -- Select buffer.
        middle_mouse_command = "bdelete! %d",   -- Close buffer.
        right_mouse_command = "bdelete! %d",    -- Close buffer.
    }
})

