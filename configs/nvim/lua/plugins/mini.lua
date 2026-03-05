nixInfo.lze.load({
	{
		"mini.nvim",
		auto_enable = true,
		after = function(_)
			local mini_modules = {
				"mini.ai",
				"mini.surround",
				"mini.splitjoin",
			}

			for _, module in ipairs(mini_modules) do
				require(module).setup()
			end
		end,
	},
})
