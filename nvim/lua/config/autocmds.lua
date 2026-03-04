-- Restore last cursor position when reopening a file
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	group = last_cursor_group,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 80,
		})
	end,
})

-- Active Highlights Treesitter for all languages
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

-- Automatically open Neo-tree when starting Neovim.
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local argv = vim.fn.argv()
		if #argv == 1 and vim.fn.isdirectory(argv[1]) == 1 then
			-- fecha o buffer vazio
			vim.cmd("enew")
			vim.cmd("bwipeout 1")

			-- Opens the neo-tree focused on the directory.
			vim.cmd("Neotree filesystem reveal left")
		end
	end,
})
