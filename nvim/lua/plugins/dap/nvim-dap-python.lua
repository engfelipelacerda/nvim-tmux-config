return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		-- Usa o debugpy instalado pelo mason (evita depender de venv manual)
		local debugpy_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
		require("dap-python").setup(debugpy_path)
	end,
}
