local function macro_recording()
	local register = vim.fn.reg_recording()
	return register ~= '' and 'recording @' .. register or ''
end

local function location_or_word_count()
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

return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	lazy = true,
	event = 'VeryLazy',
	config = function()
		local lualine = require('lualine')
		lualine.setup({
			options = {
				theme = 'auto',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' }
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff' },
				lualine_c = { 'encoding', 'filesize' },
				lualine_x = {
					macro_recording,
					{ '%S', padding = 0 }
				},
				lualine_y = { 'progress' },
				lualine_z = { location_or_word_count },
			},
			winbar = {
				lualine_a = { '' },
				lualine_b = {
					{
						'filetype',
						icon_only = true,
						colored = true,
						padding = { left = 1, right = 0 }
					},
					{
						'filename',
						path = 1,
						shorting_target = 15,
						padding = { left = 0, right = 1 }
					}
				},
				lualine_c = { '' },
				lualine_x = { 'lsp_status' },
				lualine_y = { '' },
				lualine_z = { '' }
			}
		})

		local macro_augroup = vim.api.nvim_create_augroup('LualineMacroRecording', { clear = true })
		vim.api.nvim_create_autocmd({ 'RecordingEnter', 'RecordingLeave' }, {
			group = macro_augroup,
			callback = function()
				lualine.refresh({ place = { 'statusline' } })
			end
		})
	end
}
