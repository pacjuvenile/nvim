return {
	'hiphish/rainbow-delimiters.nvim',
	dependencies = {
		'nvim-treesitter/nvim-treesitter'
	},
	lazy = false,
	config = function()
		require('rainbow-delimiters.setup').setup({})
	end
}
