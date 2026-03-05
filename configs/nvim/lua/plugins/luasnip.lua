nixInfo.lze.load({
	{
		"luasnip",
		auto_enable = true,
		after = function(_)
			local ls = require("luasnip")

			ls.config.setup({
				enable_autosnippets = true,
				store_selection_keys = "<Tab>",
			})

			ls.add_snippets("rust", require("custom.snippets.rust"))
			ls.add_snippets("python", require("custom.snippets.python"))
			ls.add_snippets("lua", require("custom.snippets.lua"))
			ls.add_snippets("typst", require("custom.snippets.typst"))
			ls.add_snippets("c", require("custom.snippets.c"))
		end,
	},
	{
		"friendly-snippets",
		auto_enable = true,
	},
})
