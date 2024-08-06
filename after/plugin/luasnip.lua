local luasnip = require("luasnip")
local loader = require("luasnip.loaders.from_lua")

-- Note that we're not using VIM-style keybindings here. Since our snippets
-- will be inserted while we're in INSERT mode, it's more likely that our index
-- finger will be on J and on H. Hence, use JKL for navigation.
local modes = { "i", "s" }
local opts = { silent = true }

vim.keymap.set(modes, "<C-j>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, opts)

vim.keymap.set(modes, "<C-k>", function()
    if luasnip.choice_active() then
        luasnip.change_choice(1)
    elseif luasnip.expandable() then
        luasnip.expand()
    end
end, opts)

vim.keymap.set(modes, "<C-l>", function()
    if luasnip.jumpable(1) then
        luasnip.jump(1)
    end
end, opts)

-- TODO: add mappings for visual mode?
local cfgpath = "~/"
if vim.loop.os_uname().sysname == "Linux" then
    cfgpath = cfgpath .. ".config/"
else
    cfgpath = cfgpath .. "AppData/Local/"
end
vim.keymap.set("n", "<leader><leader>l", "<cmd>source " .. cfgpath .. "nvim/after/plugin/luasnip.lua<CR>")

-- Set up snippet loader to access local snippet definitions.
loader.lazy_load({
    paths = {
        "~/.config/nvim/snippets/luasnip",
        "~/AppData/Local/nvim/snippets/luasnip",
    },
})

luasnip.setup({
    enable_autosnippets = true,
    history = true,
    updateevents = "TextChanged,TextChangedI",
})

