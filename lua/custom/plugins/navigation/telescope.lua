local M = {}

M.ensure_installed = true
M.url = 'https://github.com/nvim-telescope/telescope.nvim'
M.dependencies = {
	'nvim-lua/plenary.nvim',
	'nvim-tree/nvim-web-devicons',
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	}
}

M.lazy = true
M.event = 'VeryLazy'

M.config = function()
	local actions = require('telescope.actions')

	require('telescope').setup({
		defaults = {
			mappings = {
				i = {
					['<C-v>'] = actions.select_vertical,
					['<C-h>'] = actions.select_horizontal,
				}
			}
		},
		pickers = {
			find_files = {
				find_command = {
					'rg',
					'--files',
					'--hidden',
					'--glob',
					'!**/.git'
				}
			},
			live_grep = {
				glob_pattern = {
					'!**/.git/*'
				},
				additional_args = {
					'--hidden',
				},
			}
		}
	})

	-- 使用fzf作为telescope扩展
	require('telescope').load_extension('fzf')

	local dropdown_like_layout = {
		layout_strategy = 'center',
		layout_config = {
			width = 0.8,
			height = 0.5,
			anchor = "S",
			anchor_padding = 0,
			prompt_position = 'top',
			preview_cutoff = 1,
		},
		sorting_strategy = 'ascending',
		results_title = false,
		border = true,
		borderchars = {
			prompt = { "─", "│", " ", "│", "╭", "╮", " ", " " },
			results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
	}

	local horizontal_like_layout = {
		layout_strategy = 'horizontal',
		layout_config = {
			width = 0.8,
			height = 0.8,
			prompt_position = 'top',
			preview_cutoff = 1,
			preview_width = 0.5
		},
		sorting_strategy = 'ascending',
		results_title = false,
		border = true,
		borderchars = {
			prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
			results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
	}

	vim.keymap.set('n', '<leader>ff', function()
		local layout = (vim.o.columns < 100) and dropdown_like_layout or horizontal_like_layout
		require('telescope.builtin').find_files(layout)
	end, { desc = 'Telescope find file' })

	vim.keymap.set('n', '<leader>fg', function()
		local layout = (vim.o.columns < 100) and dropdown_like_layout or horizontal_like_layout
		require('telescope.builtin').live_grep(layout)
	end, { desc = 'Telescope live grep' })

	vim.keymap.set('n', '<leader>fh', function()
		local layout = (vim.o.columns < 100) and dropdown_like_layout or horizontal_like_layout
		require('telescope.builtin').help_tags(layout)
	end, { desc = 'Telescope help tags' })

	vim.keymap.set('n', '<leader>fb', function()
		local layout = (vim.o.columns < 100) and dropdown_like_layout or horizontal_like_layout
		require('telescope.builtin').buffers(layout)
	end, { desc = 'Telescope buffers' })

	vim.keymap.set('n', '<leader>fc', function()
		local layout = (vim.o.columns < 100) and dropdown_like_layout or horizontal_like_layout
		require('telescope.builtin').colorscheme(layout)
	end, { desc = 'Telescope colorscheme' })
end

return M
