local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
M.dependencies = {
	'nvim-treesitter/nvim-treesitter',
	'nvim-tree/nvim-web-devicons'
}

M.lazy = true
M.ft = "markdown"

M.config = function()
	require("render-markdown").setup({
		heading = {
			render_modes = true
		},
		code = {
			render_modes = true
		},
		bullet = {
			render_modes = true
		},
		pipe_table = {
			render_modes = true
		},
		quote = {
			render_modes = true
		}
	})
end

return M
