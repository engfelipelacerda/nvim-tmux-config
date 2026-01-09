-- ================================================================================================
-- TITLE : nvim-treesitter
-- ABOUT : Treesitter configurations and abstraction layer for Neovim.
-- LINKS :
--   > github : https://github.com/nvim-treesitter/nvim-treesitter
-- ================================================================================================

return {
	'nvim-treesitter/nvim-treesitter',
  lazy = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter.config").setup({
      install_dir = vim.fn.stdpath('data') .. '/site',
			auto_install = true, -- auto-install any other parsers on opening new language files
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
			},
		})
    require("nvim-treesitter").install({
      	"bash",
				"c",
				"cpp",
				"css",
				"dockerfile",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"rust",
				"svelte",
				"typescript",
				"vue",
				"yaml",
        "ruby",
        "tsx",
        "vue",
    })
	end,
}
