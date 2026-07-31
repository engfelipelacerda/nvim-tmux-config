local dap = require("dap")

-- ======================
-- C
-- ======================
dap.configurations.c = {
	{
		name = "Debug C",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

-- ======================
-- C++
-- ======================
dap.configurations.cpp = dap.configurations.c

-- Configura simbolos e cores do DAP
vim.fn.sign_define("DapBreakpoint", {
	text = "●",
	texthl = "DapBreakpoint",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapBreakpointCondition", {
	text = "◆",
	texthl = "DapBreakpoint",
})

vim.fn.sign_define("DapLogPoint", {
	text = "▶",
	texthl = "DapLogPoint",
})

vim.fn.sign_define("DapStopped", {
	text = "➜",
	texthl = "DapStopped",
})

vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e51400" })
vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef" })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379" })
