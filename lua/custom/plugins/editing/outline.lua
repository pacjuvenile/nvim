return {
	'hedyhli/outline.nvim',
	lazy = true,
	keys = {
		{ '<leader>o', '<cmd>Outline!<cr>', desc = 'Outline toggle' }
	},
	config = function()
		require('outline').setup({
			outline_window = {
				position = 'left',
				width = 30,
				wrap = true
			}
		})
	end
}
