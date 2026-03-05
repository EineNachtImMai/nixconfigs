-- NOTE: tabs in neovim for the different open buffers.
--[[ {
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	}, ]]

nixInfo.lze.load({
	{
		"bufferline.nvim",
		auto_enable = true,
		after = function(_)
			require("bufferline").setup({
				options = {
					hover = {
						enabled = true,
						delay = 150,
						reveal = { "close" },
					},
				},
			})
		end,
	},
})
