return {
	ts_config = {
		parser = { 'lua' }
	},
	ls_config = {
		name = 'lua_ls',
		cmd = { 'lua-language-server' },
		filetypes = { 'lua' },
		root_markers = {
			'.git'
		},
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
					path = {
						'lua/?.lua',
						'lua/?/init.lua',
					}
				},
				workspace = {
					library = {
						vim.env.VIMRUNTIME,
					}
				},
			}
		}
	}
}
