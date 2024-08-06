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
    -- Naming imports as local variables.
    s({
        trig = "req",
        name = "Require as Local Variable",
    }, fmt([[
        local {} = require("{}")
    ]], {
        f(function(name)
            local parts = vim.split(name[1][1], ".", true)
            return parts[#parts] or ""
        end, { 1 }),
        i(1),
    }, { delimieters = "{}" })),
}
