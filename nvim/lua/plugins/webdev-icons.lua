return {
	"nvim-tree/nvim-web-devicons",
	lazy = true,
	opts = {
		default = true,
		strict = true,
		override_by_extension = {
			lua = {
				icon = "",
				color = "#51a0cf",
				name = "Lua",
			},
		},
	},
}
