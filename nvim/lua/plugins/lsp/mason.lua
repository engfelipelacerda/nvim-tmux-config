return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		-- List of servers for mason to install
		ensure_installed = {
			"lua_ls",
			"ts_ls",
			"html",
			"cssls",
			"jsonls",
			"emmet_ls",
			"tailwindcss",
			"svelte",
			"pyright",
			"gopls",
			"rust-analyzer",
			"clangd",
			"jdtls",
			"intelephense",
			"ruby_lsp",
			"bashls",
			"dockerls",
			"yamlls",
			"taplo",
			"marksman",
		},
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
}
