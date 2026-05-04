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
			-- Example:
			-- "codelldb",  -- C / C++ / Rust
			-- "debugpy",   -- Python
			-- "delve",     -- Go
		},
		automatic_installation = true,
	},
}
