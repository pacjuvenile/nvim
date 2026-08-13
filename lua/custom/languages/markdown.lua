return {
	treesitter = {
		parser = {
			'markdown',
			'markdown_inline'
		}
	},
	lsp = {
		name = 'marksman',
		cmd = { 'marksman' },
		filetypes = { 'markdown' },
		root_markers = {
			'.git',
		},
		settings = {}
	}
}
