return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		-- List of servers for mason to install
		ensure_installed = {
			"bashls",
			"lua_ls",
			"ts_ls",
			"html",
			"cssls",
			"jsonls",
			"emmet_ls",
			"tailwindcss",
			"clangd",
			"jdtls",
			"dockerls",
			"yamlls",
			"marksman",
			"pyright",
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
