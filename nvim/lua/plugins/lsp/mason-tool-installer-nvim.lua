return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "mason-org/mason-lspconfig.nvim" },
	opts = {
		ensure_installed = {
			-- Formatters
			"stylua",
			"prettier",
			"black",
			"rustfmt",
			"clang-format",
			"google-java-format",
			"php-cs-fixer",
			"rubocop",
			"shfmt",
			"sql-formatter",
			"taplo",
			"clangd",
			-- Linters
			"luacheck",
			"eslint_d",
			"ruff",
			"mypy",
			"checkstyle",
			"phpstan",
			"shellcheck",
			"sqlfluff",
			"cpplint",
		},
		auto_update = false,
		run_on_start = true,
	},
}
