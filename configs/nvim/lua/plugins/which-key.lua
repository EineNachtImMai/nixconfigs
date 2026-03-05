-- NOTE:  keyboard shortcuts using space + key, shows uses and possible following keys.
--[[ {
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	}, ]]

nixInfo.lze.load({
	{
		"which-key.nvim",
		auto_enable = true,
		-- cmd = { "" },
		event = "DeferredUIEnter",
		opts = {},
		-- ft = "",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		after = function(plugin)
			require("which-key").setup({})
			require("which-key").add({
				{ "<leader>f", group = "Search" },
				{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find File", mode = "n" },
				{ "<leader>ft", "<cmd>FzfLua live_grep<cr>", desc = "Find text in all files" },
				{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Open Recent Files" },
				{ "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Browse Find Help" },
				{ "<leader>fm", "<cmd>FzfLua man_pages<cr>", desc = "Browse Man Pages" },
				{ "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Browse Keymaps" },
				{ "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Browse Commands" },
				{
					"<leader>fp",
					function()
						require("neoclip.fzf")("+")
					end,
					desc = "Browse Registers for pasting",
				},

				{ "<leader>s", group = "Sessions" },

				{ "<leader>l", group = "LSP" },
				{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
				{ "<leader>ll", vim.lsp.codelens.run, desc = "CodeLens Action" },
				{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename Symbol" },
				{ "<leader>la", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document Symbols" },
				{ "<leader>lA", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "Workspace Symbols" },
				{ "<leader>lf", "<cmd>Format<cr>", desc = "Format using conform.nvim" },

				{
					"<leader><Tab>",
					"<cmd>UndotreeToggle<CR>",
					desc = "Toggle UndoTree",
				},

				{ "<leader>b", group = "Buffers" },
				{ "<leader>bk", "<cmd>bdelete<cr>", desc = "Kill Current Buffer" },

				{ "<leader>e", "<cmd>Oil<cr>", desc = "Oil File Explorer" },

				{
					mode = { "n" },
					{ "<leader>/", require("Comment.api").toggle.linewise.current, desc = "Comment Line" }, -- the easier one: normal mode, linewise comment

					{ "<Esc>", "<cmd>nohlsearch<cr>", desc = "disable highlight for search" },
				},
				{
					mode = { "v" },
					{
						"<leader>/",
						function()
							local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
							vim.api.nvim_feedkeys("V", "nx", false) -- switch to linewise visual mode to avoid commenting from the middle of the line and other similar bullshit
							vim.api.nvim_feedkeys(esc, "nx", false) -- exit visual mode
							require("Comment.api").toggle.blockwise(vim.fn.visualmode()) -- call the blockwise comment toggle function, passing as argument the last visual mode buffer
						end,
						desc = "Comment Selection",
					}, -- Esoteric shit to make the blockwise comments not fucked up
					-- NOTE: Won't work if the language doesn't support blockwise comments (e.g. Python). I'll figure it out eventually.
				},

				{ "<leader>p", "<cmd>Lazy<cr>", desc = "Plugins" },

				{ "<leader>t", group = "Typr" },
				{ "<leader>tt", "<cmd>Typr<cr>", desc = "Open Typr" },
				{ "<leader>td", "<cmd>TyprStats<cr>", desc = "Open Typr stats tab" },

				{ "<leader>d", group = "Debug" },
				{ "<leader>dt", "<cmd>DapViewToggle<cr>", desc = "Toggle dap-view" },
				{ "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
				{ "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue" },
				{ "<leader>dw", "<cmd>DapViewWatch<cr>", desc = "Watch" },
			})
		end,
	},
})
