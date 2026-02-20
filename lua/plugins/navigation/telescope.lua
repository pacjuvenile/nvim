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
	-- 使用nerdy作为telescope扩展
	require('telescope').load_extension('nerdy')
end

return M
