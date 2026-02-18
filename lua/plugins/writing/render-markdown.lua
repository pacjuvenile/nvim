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
		sign = {
			enabled = false
		},
		anti_conceal = {
			disabled_modes = { 'n' }
		},
		win_options = {
			concealcursor = {
				rendered = 'n'
			}
		},
		heading = {
			render_modes = true,
			icons = {},
			width = 'block',
			min_width = 80
		},
		code = {
			render_modes = true,
			conceal_delimiters = false,
			language_pad = 1,
			width = 'block',
			min_width = 80,
			left_margin = 0,
			left_pad = 1,
			right_pad = 1,
			border = 'thick',
			highlight_inline = 'RenderMarkdownCodeInfo'
		},
		bullet = {
			render_modes = true
		},
		checkbox = {
			render_modes = true
		},
		pipe_table = {
			render_modes = true
		},
		quote = {
			render_modes = true
		},
		link = {
			render_modes = true
		},
		completion = {
			lsp = { enabled = true },
			blink = {enabled = true}
		}
	})
end

return M
