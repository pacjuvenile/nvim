return {
	'mikavilpas/yazi.nvim',
	version = '*',
	dependencies = {
		{
			'nvim-lua/plenary.nvim',
			lazy = true
		}
	},
	lazy = true,
	keys = {
		{ '<leader>e', [[<cmd>Yazi toggle<cr>]], desc = 'Open yazi at the current file' },
		{ '<leader>E', [[<cmd>Yazi cwd<cr>]], desc = 'Open the file manager in nvim\'s working directory' }
	},
	event = 'VeryLazy',
	config = function()
		require('yazi').setup({
			open_for_directories = true,
			change_neovim_cwd_on_close = false,

			floating_window_scaling_factor = 1,
			yazi_floating_window_border = 'none',

			keymap = {
				open_file_in_vertical_split = '<C-v>',
				open_file_in_horizontal_split = '<C-h>'
			}
		})
	end
}
