nixInfo.lze.load({
	{
		"snacks.nvim",
		auto_enable = true,
		-- snacks makes a global, and then lazily loads itself
		lazy = false,
		-- priority only affects startup plugins
		-- unless otherwise specified by a particular handler
		priority = 1000,
		after = function(plugin)
			require("snacks").setup({
				image = {
					math = {
						enabled = false,
					},
				},
			})
		end,
	},
})
