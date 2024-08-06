-- All imports shown in the LuaSnip documentation.
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


-- Start defining your snippets here.
return {
    -- Imports.
    s({
        trig = "luasnip",
        name = "LuaSnip Imports",
        desc = "Standard LuaSnip imports.",
    }, fmt([=[
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
        return {{
            {}
        }}
    ]=], {
        i(0)
    })),

    -- Snippets.
    s({
        trig = "snip",
        name = "Standard Snippet",
    }, fmt([[
        s({
            trig = "<>",
            name = "<>",
        }, fmt([=[
            <>
        ]=], {
            <>
        }, { delimieters = "{}" })),
    ]], {
        i(1, "trigger"),
        i(2, "Snippet Name"),
        i(3),
        i(4),
    }, { delimiters = "<>" })),

    s({
        trig = "asnip",
        name = "Auto Snippet",
    }, fmt([[
        s({
            trig = "<>",
            name = "<>",
            snippetType = "autosnippet",
        }, fmt([=[
            <>
        ]=], {
            <>
        }, { delimieters = "{}" })),
    ]], {
        i(1, "trigger"),
        i(2, "Snippet Name"),
        i(3),
        i(4),
    }, { delimiters = "<>" })),

    s({
        trig = "msnip",
        name = "Match Snippet",
    }, fmt([[
        s({
            trig = "<>",
            name = "<>",
            regTrig = true,
        }, fmt([=[
            <>
        ]=], {
            <>
        }, { delimieters = "{}" })),
    ]], {
        i(1, "trigger"),
        i(2, "Snippet Name"),
        i(3),
        i(4),
    }, { delimiters = "<>" })),
}
