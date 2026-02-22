local M = {}

M.ensure_installed = true
M.url = 'https://github.com/nvim-telescope/telescope.nvim'
M.dependencies = {
	'nvim-lua/plenary.nvim',
	'nvim-tree/nvim-web-devicons',
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},
	'nvim-telescope/telescope-project.nvim',
	'2KAbhishek/nerdy.nvim'
}

M.lazy = true
M.keys = {
	{ '<leader>ff', '<cmd>Telescope find_files<cr>',  desc = 'Telescope find file' },
	{ '<leader>fg', '<cmd>Telescope live_grep<cr>',   desc = 'Telescope live grep' },
	{ '<leader>fh', '<cmd>Telescope help_tags<cr>',   desc = 'Telescope help tags' },
	{ '<leader>fb', '<cmd>Telescope buffers<cr>',     desc = 'Telescope buffers' },
	{ '<leader>fc', '<cmd>Telescope colorscheme<cr>', desc = 'Telescope colorscheme' },
	{ '<leader>fn', '<cmd>Telescope nerdy<cr>',       desc = 'Telescope nerd icons' },
	{ '<leader>fp', '<cmd>Telescope project<cr>',     desc = 'Telescope project' },
}

M.config = function()
	local actions = require('telescope.actions')
	local project_actions = require('telescope._extensions.project.actions')
	local plugin_path = vim.fn.stdpath('data') .. '/lazy'

	require('telescope').setup({
		defaults = {
			layout_strategy = "center",
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
			mappings = {
				i = {
					['<C-v>'] = actions.select_vertical,
					['<C-h>'] = actions.select_horizontal,
				}
			}
		},
		pickers = {
			find_files = {
				-- theme = 'dropdown',
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
		},
		extensions = {
			project = {
				base_dirs = {
					plugin_path,
					'~/blog',
					'~/dotfiles/nixos',
					'~/dotfiles/rime',
					'~/dotfiles/kanata',
					'~/dotfiles/wezterm',
					'~/dotfiles/zshell',
					'~/dotfiles/nvim',
					'~/dotfiles/yazi',
					'~/dotfiles/qutebrowser'
				}
			}
		}
	})

	-- 使用fzf作为telescope扩展
	require('telescope').load_extension('fzf')
	-- 使用project作为telescope扩展
	require('telescope').load_extension('project')
	local telescope_augroup = vim.api.nvim_create_augroup('Telescope_augroup', { clear = true })
	-- 使用nerdy作为telescope扩展
	require('telescope').load_extension('nerdy')

	-- 和telescope相关的autocmd
	-- 每次启动刷新telescope-project
	vim.api.nvim_create_autocmd('VimEnter', {
		group = telescope_augroup,
		callback = function()
			local telescope_projects_data = vim.fn.stdpath('data') .. '/telescope-projects.txt'
			if vim.uv.fs_stat(telescope_projects_data) then
				os.remove(telescope_projects_data)
			end
		end,
		once = true
	})
end

return M
