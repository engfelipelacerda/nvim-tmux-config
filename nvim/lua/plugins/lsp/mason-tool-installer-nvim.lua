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

			-- Linters
			"eslint_d",
			"htmlhint",
			"luacheck",
			"shellcheck",
			"cpplint",
			"checkstyle",
		},
		auto_update = false,
		run_on_start = true,
	},
}
