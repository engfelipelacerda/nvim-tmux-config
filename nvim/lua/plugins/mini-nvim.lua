-- ================================================================================================
-- TITLE : mini.nvim
-- LINKS :
--   > github : https://github.com/echasnovski/mini.nvim
-- ABOUT : Library of 40+ independent Lua modules.
-- ================================================================================================

return {
	{
		"echasnovski/mini.indentscope",
		version = "*",
		-- Shows animated indent guides and highlights the current scope.
		opts = {},
	},

	{
		"echasnovski/mini.comment",
		version = "*",
		-- Adds easy commenting/uncommenting for lines and blocks of code.
		opts = {},
	},

	{
		"echasnovski/mini.pairs",
		version = "*",
		-- Automatically inserts matching pairs like (), {}, [], "", ''.
		opts = {},
	},

	{
		"echasnovski/mini.move",
		version = "*",
		-- Allows moving lines, blocks, and selections with keybindings.
		opts = {},
	},

	{
		"echasnovski/mini.surround",
		version = "*",
		-- Adds, deletes, replaces, and finds surrounding characters/tags.
		opts = {},
	},

	{
		"echasnovski/mini.cursorword",
		version = "*",
		-- Highlights the word currently under the cursor.
		opts = {},
	},

	{
		"echasnovski/mini.trailspace",
		version = "*",
		-- Detects and removes trailing whitespace in files.
		opts = {},
	},

	{
		"echasnovski/mini.bufremove",
		version = "*",
		-- Deletes buffers without messing up window layout or splits.
		opts = {},
	},

	{
		"echasnovski/mini.ai",
		version = "*",
		-- Extends and improves textobjects for smarter selections.
		opts = {},
	},
}
