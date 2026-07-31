return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason-lspconfig.nvim" },
	opts = {
		ensure_installed = {
			-- Formatters
			"stylua",
			"prettier",
			"clang-format",
			"shfmt",
			"ruff",

			-- Linters
			"eslint_d",
			"htmlhint",
			"luacheck",
			"shellcheck",
			"cpplint",
			"checkstyle",

			-- Java DAP bundles (usados pelo jdtls para debug)
			"java-debug-adapter",
			"java-test",
		},
		auto_update = false,
		run_on_start = true,
	},
}
