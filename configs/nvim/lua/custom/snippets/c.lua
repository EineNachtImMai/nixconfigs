require("luasnip.session.snippet_collection").clear_snippets("c")
local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep

local fmta = require("luasnip.extras.fmt").fmta

return {
	s(
		"main",
		fmta(
			[[ 
int main(int argc, char* argv[])
{
    <>
    return 0;
}
    ]],
			{
				i(1),
			}
		)
	),
}
