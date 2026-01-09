return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()
		-- Keymaps
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Start / Continue debug" })
		vim.keymap.set("n", "<Leader>dq", dap.terminate, { desc = "Terminate debug session" })
		vim.keymap.set("n", "<Leader>dd", dap.disconnect, { desc = "Disconnect debugger" })
		vim.keymap.set("n", "<Leader>dr", dap.restart, { desc = "Restart debug session" })

		-- Auto open / close dap-ui
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		require("config.dap-adapters")
		require("config.dap")
	end,
}
