return {
	'catppuccin/nvim',
	name = 'catppuccin',
	lazy = false,
	config = function()
		require('catppuccin').setup({
			transparent_background = true,
			styles = {
				keywords = { 'italic' }
			},
			integrations = {
				rainbow_delimiters = true,
				telescope = { enabled = true }
			}
		})
		vim.cmd('colorscheme catppuccin-macchiato')
	end
}
