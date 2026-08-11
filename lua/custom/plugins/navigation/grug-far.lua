return {
	'MagicDuck/grug-far.nvim',
	dependencies = {
		{ url = 'nvim-tree/nvim-web-devicons' }
	},
	lazy = true,
	cmd = 'GrugFar',
	config = function()
		require('grug-far').setup({
			windowCreationCommand = ''
		})
	end
}
