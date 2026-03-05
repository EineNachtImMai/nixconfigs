nixInfo.lze.load({
	{
		"todo-comments.nvim",
		auto_enable = true,
		after = function(_)
			require("todo-comments").setup({})
		end,
	},
})
