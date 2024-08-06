-- LuaSnip nodes and functionality.
local luasnip = require("luasnip")

local ai = require("luasnip.nodes.absolute_indexer")
local conds = require("luasnip.extras.expand_conditions")
local events = require("luasnip.util.events")
local extras = require("luasnip.extras")
local format = require("luasnip.extras.fmt")
local types = require("luasnip.util.types")

local c = luasnip.choice_node
local d = luasnip.dynamic_node
local f = luasnip.function_node
local i = luasnip.insert_node
local isn = luasnip.indent_snippet_node
local ms = luasnip.multi_snippet
local r = luasnip.restore_node
local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node

local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda

local fmt = format.fmt
local fmta = format.fmta

local k = require("luasnip.nodes.key_indexer").new_key
local parse = require("luasnip.util.parser").parse_snippet
local postfix = require("luasnip.extras.postfix").postfix


-- Snippets.
return {
    s({
        trig = "fn",
        name = "Bash Function",
    }, fmt([[
        # {}
        #
        # {}
        {} () {{{}
            return 0
        }}
    ]], {
        rep(1),
        i(2, "[EDIT] Function description."),
        i(1, "function_name"),
        i(0),
    }, { delimieters = "{}" })),

    s({
        trig = "fn(%d)",
        name = "Bash Function",
        regTrig = true,
    }, fmt([[
        # {}
        #
        # {}
        #
        # Parameters:{}
        {} () {{{}

            return 0
        }}
    ]], {
        rep(1),
        i(4, "[EDIT] Function description."),
        d(3, function(args, snip)
            local nparams = tonumber(snip.captures[1])
            local nodes = {}

            if (#args[1] > nparams) then
                for n=1,nparams do
                    local pname = vim.split(args[1][n+1]:gsub("%s+", ""), "=")[1]

                    table.insert(nodes, t({"", n .. " "}))
                    table.insert(nodes, t(pname .. " "))
                    table.insert(nodes, i(n, "DESCRIPTION"))
                end
            end

            return isn(nil, nodes, "$PARENT_INDENT#   ")
        end, {2}),
        i(1, "function_name"),
        d(2, function(args, snip)
            local nparams = tonumber(snip.captures[1])
            local nodes = {}

            for n=1,nparams do
                table.insert(nodes, t({"", ""}))
                table.insert(nodes, i(n, "parameter" .. n))
                table.insert(nodes, t([[="${]] .. n .. [[}"]]))
            end
            return isn(nil, nodes, "$PARENT_INDENT    ")
        end),
    }, { delimieters = "{}" })),
}
