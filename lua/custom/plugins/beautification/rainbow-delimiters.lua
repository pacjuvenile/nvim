return {
	ensure_installed = true,
	url = "https://github.com/hiphish/rainbow-delimiters.nvim",
	dependencies = {
		{
			url = "https://github.com/nvim-treesitter/nvim-treesitter"
		}
	},

	enabled = true,
	lazy = false,

	config = function ()
		require('rainbow-delimiters.setup').setup({})
	end
}
