return {
	ts_config = {
		parser = { 'rust' }
	},
	ls_config = {
		name = 'rust_analyzer',
		cmd = { 'rust-analyzer' } ,
		filetypes = { 'rust' },
		root_markers = {
			'Cargo.toml',
			'.git',
		},
		capabilities = {
			experimental = {
				serverStatusNotification = true,
				commands = {
					'rust-analyzer.showReferences',
					'rust-analyzer.runSingle',
					'rust-analyzer.debugSingle',
				},
			},
		},
		settings = {
			['rust-analyzer'] = {
				lens = {
					debug = { enable = true },
					enable = true,
					implementations = { enable = true },
					references = {
						adt = { enable = true },
						enumVariant = { enable = true },
						method = { enable = true },
						trait = { enable = true },
					},
					run = { enable = true },
					updateTest = { enable = true },
				},
			},
		}
	}
}
