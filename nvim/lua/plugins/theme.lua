return {
	{
		"Tsuzat/NeoSolarized.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local ok, NeoSolarized = pcall(require, "NeoSolarized")
			if not ok then
				return
			end

			NeoSolarized.setup({
				style = "dark", -- "dark" ou "light"
				transparent = true,
				terminal_colors = true,
				enable_italics = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = { bold = true },
					string = { italic = true },
					underline = true,
					undercurl = true,
				},
			})
			vim.cmd("colorscheme NeoSolarized")
		end,
	},
}
