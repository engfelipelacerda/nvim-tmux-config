return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		notify.setup({
			stages = "slide",
			timeout = 3000,
			render = "default",
			background_colour = "#000000",
		})

		vim.notify = notify

		-- Disable LSP progress notifications
		vim.lsp.handlers["$/progress"] = function() end
	end,
}
