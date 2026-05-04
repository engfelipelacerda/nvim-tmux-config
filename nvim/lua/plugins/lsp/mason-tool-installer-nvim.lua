return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason-lspconfig.nvim" },
	opts = {
		ensure_installed = {
			-- Formatters
			"stylua",
			"prettier",
			"clang-format",

			-- LSP
			"clangd",

			-- Linters
			"eslint_d",
		},
		auto_update = false,
		run_on_start = true,
	},
}
