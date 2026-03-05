nixInfo.lze.load({
	{
		"comment.nvim",
		auto_enable = true,
        after = function (_)
            require("Comment").setup()
        end
	},
})
