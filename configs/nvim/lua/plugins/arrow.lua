nixInfo.lze.load({
	{
		"arrow.nvim",
		auto_enable = true,
		opts = {
			show_icons = true,
			leader_key = "<leader>aa", -- Recommended to be a single key
			buffer_leader_key = "<leader>ab", -- Per Buffer Mappings
			global_bookmarks = false, -- Allow the bookmarks to not be project-dependent
		},
	},
})
