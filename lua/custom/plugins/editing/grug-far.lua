return {
	'MagicDuck/grug-far.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	lazy = true,
	cmd = 'GrugFar',
	config = function()
		require('grug-far').setup({
			windowCreationCommand = ''
		})
	end
}
