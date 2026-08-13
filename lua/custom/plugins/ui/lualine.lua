return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	lazy = true,
	event = 'VeryLazy',
	config = function()
		require('lualine').setup({
			options = {
				theme = 'auto',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' }
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff' },
				lualine_c = { 'filename', 'encoding', 'filesize' },
				lualine_x = { 'lsp_status' },
				lualine_y = { 'progress' },
				lualine_z = {
					function()
						local prose_filetypes = { 'markdown', 'text' }
						if not vim.tbl_contains(prose_filetypes, vim.bo.filetype) then
							return '%l:%c'
						end

						local word_count = 0
						if vim.fn.mode() == 'v' or vim.fn.mode() == 'V' or vim.fn.mode() == '\22' then
							word_count = vim.fn.wordcount().visual_words
						else
							word_count = vim.fn.wordcount().words
						end
						return word_count .. ' words'
					end
				},
			},
			winbar = {
				lualine_a = { '' },
				lualine_b = { 'filename' },
				lualine_c = { 'filetype' },
				lualine_x = { '' },
				lualine_y = { '' },
				lualine_z = { '' }
			}
		})
	end
}
