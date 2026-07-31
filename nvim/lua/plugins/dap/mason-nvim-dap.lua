return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	opts = {
		ensure_installed = {
			-- Debug adapters (DAPs)
			-- Add here the debug adapters you actually use for your languages.
			"codelldb", -- C / C++
			"debugpy", -- Python
		},
		automatic_installation = true,
	},
}
