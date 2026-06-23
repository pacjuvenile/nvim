return {
	url = 'https://github.com/stevearc/oil.nvim',

	enabled = false,
	lazy = false,

	config = function ()
		require('oil').setup({
			default_file_explorer = true,
			keymaps = {
				["h"] = { "actions.parent", mode = "n" },
				["l"] = { "actions.select", mode = "n" }
			}
		})
	end
}
