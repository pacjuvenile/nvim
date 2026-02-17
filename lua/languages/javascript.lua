local M = {}

M.ts_config = {
	parser = { 'javascript' }
}

M.ls_config = {
	name = 'ts_ls',
	cmd = { 'typescript-language-server', '--stdio' },
	filetypes = {
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx'
	},
	root_dir = {
		'.git'
	}
}

return M
