local comment = require("Comment")

comment.setup({
    padding = true,     -- Add space between comment and the line.
    sticky = true,      -- Keep mouse in same position.

    mappings = {
        basic = true,
        extended = true,
    },
    opleader ={
        block = "gb",
        line = "gc",
    },

    toggler ={
        block = "gbc",
        line = "gcc",
    },
    extra = {
        above = "gcO",
        below = "gco",
        eol = "gca",
    },
})

