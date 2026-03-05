-- NOTE: status line at the bottom of the screen.
--[[ {
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	}, ]]

nixInfo.lze.load({
	{
		"lualine.nvim",
		auto_enable = true,
		-- cmd = { "" },
		event = "DeferredUIEnter",
		-- ft = "",
		-- keys = "",
		-- colorscheme = "",
		after = function(plugin)
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = {
						function()
							local reg = vim.fn.reg_recording()
							-- If a macro is being recorded, show "Recording @<register>"
							if reg ~= "" then
								return "Recording @" .. reg
							else
								-- Get the full mode name using nvim_get_mode()
								local mode = vim.api.nvim_get_mode().mode
								local mode_map = {
									n = "NORMAL",
									i = "INSERT",
									v = "VISUAL",
									V = "V-LINE",
									["^V"] = "V-BLOCK",
									c = "COMMAND",
									R = "REPLACE",
									s = "SELECT",
									S = "S-LINE",
									["^S"] = "S-BLOCK",
									t = "TERMINAL",
								}

								-- Return the full mode name
								return mode_map[mode] or mode:upper()
							end
						end,
					},
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
})
