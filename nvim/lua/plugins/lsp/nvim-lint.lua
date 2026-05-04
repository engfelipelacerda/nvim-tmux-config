return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			lua = { "luacheck" },
			sh = { "shellcheck" },
			bash = { "shellcheck" },
			c = { "cpplint" },
			cpp = { "cpplint" },
			java = { "checkstyle" },
			html = { "htmlhint" },
		}

		-- Rodar lint automaticamente
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
