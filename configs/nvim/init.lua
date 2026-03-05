require("setup")
require("options")
require("keybinds")

require("colorscheme")
require("plugins")
require("custom-plugins")
require("lsp")

-- set handler for displaying diagnostics
vim.diagnostic.config({ virtual_text = false })

-- custom icons for linting
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
})

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})
