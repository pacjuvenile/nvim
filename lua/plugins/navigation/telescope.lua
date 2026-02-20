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
	'2KAbhishek/nerdy.nvim'
}

M.lazy = true
M.keys = {
	{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Telescope find file' },
	{ '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Telescope live grep' },
	{ '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Telescope help tags' },
	{ '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Telescope buffers' },
	{ '<leader>fc', '<cmd>Telescope colorscheme<cr>', desc = 'Telescope colorscheme' },
	{ '<leader>fn', '<cmd>Telescope nerdy<cr>', desc = 'Telescope browser nerd icons' },

	-- 查找特定目录
	{
		'<leader>fdni',
		function()
			local nixos_path = '/home/pacjuvenile/dotfiles/nixos/'
			if vim.uv.fs_stat(nixos_path) then
				local opts = { cwd = nixos_path }
				require('telescope.builtin').find_files(opts)
			end
		end,
		desc = 'Telescope find directory nixos'
	},
	{
		'<leader>fdr',
		function()
			local rime_path = '/home/pacjuvenile/dotfiles/rime/'
			if vim.uv.fs_stat(rime_path) then
				local opts = { cwd = rime_path }
				require('telescope.builtin').find_files(opts)
			end
		end,
		desc = 'Telescope find directory rime'
	},
	{
		'<leader>fdk',
		function()
			local kanata_path = '/home/pacjuvenile/dotfiles/kanata/'
			if vim.uv.fs_stat(kanata_path) then
				local opts = { cwd = kanata_path }
				require('telescope.builtin').find_files(opts)
			end
		end,
		desc = 'Telescope find directory kanata'
	},
	{
		'<leader>fdz',
		function()
			local zshell_path = '/home/pacjuvenile/dotfiles/zshell/'
			if vim.uv.fs_stat(zshell_path) then
				local opts = { cwd = zshell_path }
				require('telescope.builtin').find_files(opts)
			end
		end,
		desc = 'Telescope find directory zshell'
	},
	{
		'<leader>fdnv',
		function()
			local nvim_path = '/home/pacjuvenile/dotfiles/nvim/'
			if vim.uv.fs_stat(nvim_path) then
				local opts = { cwd = nvim_path }
				require('telescope.builtin').find_files(opts)
			end
		end,
		desc = 'Telescope find directory nvim'
	},
	{
		'<leader>fdqb',
		function()
			local qutebrowser_path = '/home/pacjuvenile/dotfiles/qutebrowser/'
			if vim.uv.fs_stat(qutebrowser_path) then
				local opts = { cwd = qutebrowser_path }
				require('telescope.builtin').find_files(opts)
			end
		end,
		desc = 'Telescope find directory qutebrowser'
	},
	{
		'<leader>fdb',
		function()
			local blog_path = "/home/pacjuvenile/blog/"
			if vim.uv.fs_stat(blog_path) then
				local opts = { cwd = blog_path }
				require('telescope.builtin').find_files(opts)
			end
		end,
		desc = 'Telescope find directory blog'
	}
}

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
	-- 使用nerdy作为telescope扩展
	require('telescope').load_extension('nerdy')
end

return M
