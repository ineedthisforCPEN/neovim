-- LuaSnip nodes and functionality.
local luasnip = require("luasnip")
local format = require("luasnip.extras.fmt")

local c = luasnip.choice_node
local f = luasnip.function_node
local i = luasnip.insert_node
local s = luasnip.snippet
local t = luasnip.text_node

local fmt = format.fmt


-- Helper functions.
local get_filename = function()
    return vim.fn.expand("%:p:t")
end


-- Snippets.
return {
    -- Introductory pre-able for scripts.
    s({
        trig = "pre",
        name = "Introductory Pre-Amble",
    }, fmt([[
        #!/usr/bin/bash
        #
        # {}
        #
        # {}
        #
        # Usage:
        #   {}
        #
        # Copyright (C) {} Microsoft Corporation - All Rights Reserved.
    ]], {
        f(get_filename),
        i(1, "[EDIT] Describe what the script does."),
        c(2, {
            f(function() return "./" .. get_filename() end),
            f(function() return "source ./" .. get_filename() end),
        }),
        f(function() return os.date("%Y") end),
    }, { delimieters = "{}" })),

    -- Error handling.
    s({
        trig = "handle",
        name = "Run Command With Error Handling",
    }, fmt([=[
        output="$({})"
        err="$?"

        if [[ "${{err}}" != "${{{}}}" ]]; then
            {}
        fi
    ]=], {
        i(1),
        i(2, "ERRNO_SUCCESS"),
        c(3, {
            fmt([[
                log "ERROR" "{}"
                    return "${{{}}}"
            ]], {
                i(1, "Command failed with error code '${err}'."),
                i(2, "ERRNO_GENERIC"),
            }),

            fmt([[
                return "${{{}}}"
            ]], {
                i(1, "ERRNO_GENERIC"),
            }),

            t("return 0"),
        }),
    }, { delimieters = "{}" })),
}
