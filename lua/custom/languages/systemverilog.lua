return {
	ts_config = {
		parser = { 'systemverilog' }
	},
	ls_config = {
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
