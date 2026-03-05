vim.lsp.config.tinymist = {
	cmd = { "tinymist" },
	filetypes = { "typst" },
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onType",
		semanticTokens = "disable",
	},
}

vim.lsp.config.nixd = {
	cmd = { "nixd" },
	filetypes = { "nix" },
	settings = {
		nixd = {
			nixpkgs = { expr = 'import (builtins.getFlake "/etc/nixos").nixosConfigurations.inputs.nixpkgs {}' },
			formatting = { command = { "alejandra" } },
		},
	},
}

vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
}

vim.lsp.config.rust_analyzer = {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
}

vim.lsp.config.gopls = {
	cmd = { "gopls" },
	filetypes = { "go", "gomod" },
}

vim.lsp.config.pyright = {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python", "py" },
}
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.config.markdown_oxide = {
	cmd = { "markdown_oxide" },
	filetypes = { "markdown" },
	-- Ensure that dynamicRegistration is enabled! This allows the LS to take into account actions like the
	-- Create Unresolved File code action, resolving completions for unindexed code blocks, ...
	capabilities = vim.tbl_deep_extend("force", capabilities, {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	}),
	on_attach = on_attach, -- configure your on attach config
}

vim.lsp.config.clangd = {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
}

vim.lsp.config.typescript_ls = {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "typescript" },
}

-- lsp.haskell_ls.setup {}

vim.lsp.enable({
	"tinymist",
	"clangd",
	"pyright",
	"gopls",
	-- "rust_analyzer", NOTE: this one is taken care of by the rust plugin
	"lua_ls",
	"nixd",
	"markdown_oxide",
	"typescript_ls",
})
