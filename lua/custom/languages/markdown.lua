return {
	ts_config = {
		ensure_installed = true,
		parser = {
			'markdown',
			'markdown_inline'
		}
	},
	ls_config = {
		name = 'marksman',
		cmd = { 'marksman' },
		filetypes = { 'markdown' },
		root_markers = {
			'.git',
		},
		settings = {}
	}
}
