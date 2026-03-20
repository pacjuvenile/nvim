local M = {}

M.url = 'https://github.com/sphamba/smear-cursor.nvim'

M.lazy = true
M.event = 'VeryLazy'

M.config = function ()
	require("smear_cursor").setup({
		smear_between_buffers = true,
	
	})
end


return M
