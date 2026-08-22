local do_augroup = vim.api.nvim_create_augroup('Do', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
	group = do_augroup,
	pattern = { '*.do' },
	callback = function()
		vim.bo.filetype = 'bash'
		vim.wo[0][0].foldmethod = 'manual'
	end
})

return {
	treesitter = {
		parser = { 'bash', 'zsh', 'powershell' }
	},
	lsp = {
		name = 'bashls',
		cmd = { 'bash-language-server', 'start' },
		filetypes = { 'sh', 'bash', 'zsh' },
		root_markers = { '.git' },
		settings = {
			bashIde = {
				globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.zsh|.command)'
			},
		}
	}
}
