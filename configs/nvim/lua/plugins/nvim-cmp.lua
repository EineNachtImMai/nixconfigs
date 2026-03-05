-- NOTE: autocompletion from snippets.
-- {
-- 	"hrsh7th/nvim-cmp",
-- 	opts = function(_, opts)
-- 		opts.sources = opts.sources or {}
-- 		table.insert(opts.sources, {
-- 			name = "lazydev",
-- 			group_index = 0, -- set group index to 0 to skip loading LuaLS completions
-- 		})
-- 	end,
-- },

nixInfo.lze.load({
	{
		"colorful-menu.nvim",
		auto_enable = true,
		after = function(_)
			require("colorful-menu").setup({})
		end,
	},
	{
		"nvim-cmp",
		auto_enable = true,
		event = "DeferredUIEnter",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
		after = function(_)
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-e>"] = cmp.mapping.scroll_docs(4),
					["<C-f>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						--[[ elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump() ]]
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						--[[ elseif luasnip.jumpable(-1) then
				luasnip.jump(-1) ]]
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-Space>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "buffer" },
					{ name = "path" },
				}),

				experimental = {
					ghost_text = true,
				},
				formatting = {
					format = function(entry, vim_item)
						local highlights_info = require("colorful-menu").cmp_highlights(entry)

						-- highlight_info is nil means we are missing the ts parser, it's
						-- better to fallback to use default `vim_item.abbr`. What this plugin
						-- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
						if highlights_info ~= nil then
							vim_item.abbr_hl_group = highlights_info.highlights
							vim_item.abbr = highlights_info.text
						end

						return vim_item
					end,
				},
			})

			luasnip.config.set_config({
				history = false,
				updateevent = "TextChanged,TextChangedI",
			})

			for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
				loadfile(ft_path)()
			end

			-- Disable cmp-buffer for Markdown and txt files
			cmp.setup.filetype({ "markdown", "txt" }, {
				sources = cmp.config.sources({
					{
						name = "nvim_lsp",
						option = {
							markdown_oxide = {
								keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
							},
						},
					},
					{ name = "luasnip" }, -- For luasnip users.
				}),
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},
	{
		"cmp-cmdline",
		auto_enable = true,
		on_plugin = { "nvim-cmp" },
		load = nixInfo.lze.loaders.with_after,
	},
	{
		"cmp-nvim-lsp",
		auto_enable = true,
		on_plugin = { "nvim-cmp" },
		load = nixInfo.lze.loaders.with_after,
	},
	{
		"cmp-nvim-lua",
		auto_enable = true,
		on_plugin = { "nvim-cmp" },
		load = nixInfo.lze.loaders.with_after,
	},
	{
		"cmp-buffer",
		auto_enable = true,
		on_plugin = { "nvim-cmp" },
		load = nixInfo.lze.loaders.with_after,
	},
	{
		"cmp-path",
		auto_enable = true,
		on_plugin = { "nvim-cmp" },
		load = nixInfo.lze.loaders.with_after,
	},
	{
		"cmp-luasnip",
		auto_enable = true,
		on_plugin = { "nvim-cmp" },
		load = nixInfo.lze.loaders.with_after,
	},
	{
		-- lazydev makes your lua lsp load only the relevant definitions for a file.
		-- It also gives us a nice way to correlate globals we create with files.
		"lazydev.nvim",
		auto_enable = true,
		cmd = { "LazyDev" },
		on_plugin = { "nvim-cmp" },
		ft = "lua",
		after = function(_)
			require("lazydev").setup({
				library = {
					{ words = { "nixInfo%.lze" }, path = nixInfo("lze", "plugins", "start", "lze") .. "/lua" },
					{
						words = { "nixInfo%.lze" },
						path = nixInfo("lzextras", "plugins", "start", "lzextras") .. "/lua",
					},
				},
			})
		end,
	},
})
