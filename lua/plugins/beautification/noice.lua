local M = {}

M.ensure_installed = false
M.url = 'https://github.com/folke/noice.nvim'
M.dependencies = {
	'MunifTanjim/nui.nvim',
	'rcarriga/nvim-notify'
}

M.lazy = true
M.event = 'VeryLazy'

M.config = function()
	require('noice').setup({
		views = {
			popup = {
				border = {
					style = 'double'
				}
			}
		}
	})
end

return M
