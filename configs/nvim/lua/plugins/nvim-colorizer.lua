nixInfo.lze.load({
	{
		"nvim-colorizer.lua",
		auto_enable = true,
        after = function (_)
            require("colorizer").setup()
        end
	},
})
