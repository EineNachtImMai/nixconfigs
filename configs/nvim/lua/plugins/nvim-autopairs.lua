nixInfo.lze.load({
	{
		"nvim-autopairs",
		auto_enable = true,
		after = function(_)
			-- Setup autopairs with nvim-cmp.
			local status_ok, npairs = pcall(require, "nvim-autopairs")
			if not status_ok then
				return
			end

			local handlers = require("nvim-autopairs.completion.handlers")

			npairs.setup({
				check_ts = true,
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
					java = false,
				},
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					offset = 0, -- Offset from pattern match
					end_key = "$",
					keys = "azertyuiopqsdfghjklmwxcvbn",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
			})

			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			print(vim.inspect(cond))

			npairs.add_rules({
				Rule("$", "$", { "typ", "typst" })
					-- don't add a pair if the next character is %
					:with_pair(cond.none()),
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if not cmp_status_ok then
				return
			end
			cmp.event:on(
				"confirm_done",
				cmp_autopairs.on_confirm_done({
					map_char = {
						tex = "",
					},
				})
			)
		end,
	},
})
