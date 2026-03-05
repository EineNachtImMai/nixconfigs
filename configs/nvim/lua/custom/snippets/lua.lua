require("luasnip.session.snippet_collection").clear_snippets("elixir")

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt

return {
	s("hello", {
		t("println!('Hello World')"),
	}),
	s(
		"snip",
		fmt(
			[[ 
    ls.add_snippets("{}", require("custom.snippets.{}"))
    ]],
			{
				i(1),
				rep(1),
			}
		)
	),
}
