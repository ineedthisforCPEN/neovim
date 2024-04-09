local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
    }),

    -- REQUIRED - you must have a snippet engine for completion to work.
    snippet = {
        expand = function()
            luasnip.lsp_expand(args.body)
        end,
    },

    -- Completion sources.
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 4 },
        { name = "path",   keyword_length = 4 },
    }),
})

-- Any filetype-specific configuration should go below.
cmp.setup.filetype({})

