local M = {}

M.url = 'https://github.com/akinsho/toggleterm.nvim'
M.version = '*'

M.lazy = false
M.keys = {
	{
		'<leader>th',
		function()
			local size = vim.o.lines * 0.4
			local direction = 'horizontal'
			vim.cmd(vim.v.count1 .. 'ToggleTerm direction=' .. direction .. ' size=' .. size)
		end,
		desc = 'toggle terminal horizontal'
	},
	{
		'<leader>tv',
		function()
			local size = vim.o.columns * 0.5
			local direction = 'vertical'
			vim.cmd(vim.v.count1 .. 'ToggleTerm direction=' .. direction .. ' size=' .. size)
		end,
		desc = 'toggle terminal vertical'
	},
	{
		'<leader>tf',
		function()
			local direction = 'float'
			vim.cmd(vim.v.count1 .. 'ToggleTerm direction=' .. direction)
		end,
		desc = 'toggle terminal float'
	}
}

M.config = function()
	require('toggleterm').setup({
		float_opts = {
			border = 'curved',
			winblend = 3,
		},
		on_open = function(term)
			vim.cmd("startinsert!")

			if term.direction == 'float' then
				vim.api.nvim_win_set_config(term.window, {
					anchor = 'NW',
					relative = 'tabline',
					row = math.floor(vim.o.lines * 0.2),
					col = math.floor(vim.o.columns * 0.1),
					height = math.floor(vim.o.lines * 0.5),
					width = math.floor(vim.o.columns * 0.8),
				})
			end
		end
	})
end

return M
