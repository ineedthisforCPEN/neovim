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

local fmt = format.fmt


-- Helper functions.
local if_present = function(n, replace)
    return function(_, snip)
        if (snip.captures[n] ~= "") then
            return replace
        end
        return ""
    end
end

local get_capture = function(n)
    return function(_, snip)
        return snip.captures[n]
    end
end


-- Snippets.
return {
    -- Tests.
    s({
        trig = "test(n?)(%a=)",
        name = "Test Condition",
        regTrig = true,
    }, fmt([=[
        [[{} -{} "{}" ]]
    ]=], {
        f(if_present(1, " !")),
        f(get_capture(2)),
        i(1, "${variable}"),
    }, { delimieters = "{}" })),

    s({
        trig = "([%p%w]+)empty",
        name = "Variable Empty",
        regTrig = true,
    }, fmt([=[
        [[ -{} "${{{}}}" ]]
    ]=], {
        c(1, { t("z"), t("n") }),
        f(get_capture(1)),
    }, { delimieters = "{}" })),


    -- For loops.
    s({
        trig = "for(%a+)",
        name = "C-Style For Loop",
        regTrig = true,
    }, fmt([=[
        for (( {} = 0; {} < {}; {}++ )); do
            {}
        done
    ]=], {
        f(get_capture(1)),
        f(get_capture(1)),
        i(1, "10"),
        f(get_capture(1)),
        i(0),
    }, { delimieters = "{}" })),

    s({
        trig = "foreach",
        name = "ForEach",
        desc = "Iterate over each element of an array.",
        snippetType = "autosnippet",
    }, fmt([=[
        for {} in "${{{}[@]}}"; do
            {}
        done
    ]=], {
        i(1, "item"),
        i(2, "array"),
        i(0),
    }, { delimieters = "{}" })),

    -- Switch-case.
    -- TODO
}
