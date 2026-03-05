nixInfo.lze.load({
	{
		-- lze specs need a name
		"trigger_colorscheme",
		-- lazy loaded colorscheme.
		-- This means you will need to add the colorscheme you want to lze sometime before VimEnter is done
		event = "VimEnter",
		-- Also, lze can load more than just plugins.
		-- The default load field contains vim.cmd.packadd
		-- Here we override it to schedule when our colorscheme is loaded
		load = function(_name)
			-- schedule so it runs after VimEnter
			vim.schedule(function()
				vim.cmd.colorscheme(nixInfo("lunar", "settings", "colorscheme"))
			end)
		end,
	},
})
