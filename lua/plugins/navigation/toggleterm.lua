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
			local size = vim.o.lines * 0.1
			local direction = 'float'
			vim.cmd(vim.v.count1 .. 'ToggleTerm direction=' .. direction .. ' size=' .. size)
		end,
		desc = 'toggle terminal float'
	}
}

M.config = function()
	require('toggleterm').setup({})
end

return M
