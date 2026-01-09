local dap = require("dap")

-- ======================
-- Rust
-- ======================
dap.configurations.rust = {
	{
		name = "Debug executable",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

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

-- ======================
-- Go
-- ======================
dap.configurations.go = {
	{
		type = "go",
		name = "Debug file",
		request = "launch",
		program = "${file}",
	},
	{
		type = "go",
		name = "Debug package",
		request = "launch",
		program = "${fileDirname}",
	},
	{
		type = "go",
		name = "Debug test",
		request = "launch",
		mode = "test",
		program = "${fileDirname}",
	},
}

-- ======================
-- Python
-- ======================
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Debug file",
		program = "${file}",
		pythonPath = function()
			return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
		end,
	},
}

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
