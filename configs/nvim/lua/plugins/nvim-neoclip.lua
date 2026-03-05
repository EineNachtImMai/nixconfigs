nixInfo.lze.load({
	{
		"nvim-neoclip.lua",
		auto_enable = true,
		after = function(_)
			require("neoclip").setup()
		end,
	},
})
