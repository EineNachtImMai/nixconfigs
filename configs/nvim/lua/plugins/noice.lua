-- NOTE: Nicer UI for notifications, commands, password input, ...
-- {
-- 	"folke/noice.nvim",
-- 	event = "VeryLazy",
-- 	opts = {},
-- 	dependencies = {
-- 		"MunifTanjim/nui.nvim",
-- 		"rcarriga/nvim-notify",
-- 	},
-- },

nixInfo.lze.load({
	{
		"noice.nvim",
		opts = {},
		auto_enable = true,
		after = function(_)
			require("noice").setup({
				routes = {
					{
						view = "popup",
						filter = {
							cmdline = "^:!",
						},
					},
				},
			})
		end,
	},
})
