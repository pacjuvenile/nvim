return {
	treesitter = {
		parser = { 'systemverilog' }
	},
	lsp = {
		name = 'svls',
		cmd = { 'svls' },
		filetypes = { 'systemverilog', 'verilog' },
		root_markers = { '.git' },
		settings = {
			svls = {
				option = {
					linter = false
				}
			}
		}
	}
}
