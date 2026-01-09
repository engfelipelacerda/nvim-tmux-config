return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	opts = {
		ensure_installed = {
			-- DAPs
			"codelldb", -- Rust
			"debugpy", -- Python
			"delve", -- Go
		},
		automatic_installation = true,
	},
}
