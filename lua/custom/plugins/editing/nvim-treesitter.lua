return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	lazy = false,
	config = function()
		-- install dir
		local install_dir = vim.fn.stdpath('data') .. '/site'
		require('nvim-treesitter').setup({
			install_dir = install_dir
		})

		-- parser registry and install
		local ensure_installed = {
			-- document query
			'vim',
			'vimdoc',
			'query',
			-- script
			'json',
			'matlab',
			'commonlisp'
		}

		local treesitter_configs = require('custom.languages').treesitter_configs
		for _, treesitter in ipairs(treesitter_configs) do
			if treesitter.ensure_installed ~= false then
				for _, parser in ipairs(treesitter.parser) do
					if not vim.tbl_contains(ensure_installed, parser) then
						table.insert(ensure_installed, parser)
					end
				end
			end
		end
		require('nvim-treesitter').install(ensure_installed)

		local treesitter_augroup = vim.api.nvim_create_augroup('Treesitter', { clear = true })
		-- clean unused parser
		vim.api.nvim_create_autocmd('User', {
			group = treesitter_augroup,
			pattern = 'VeryLazy',
			callback = function()
				local local_parsers_full_dir = vim.fn.glob(install_dir .. '/parser/**/*.so', false, true)
				for _, local_parser_full_dir in ipairs(local_parsers_full_dir) do
					local local_parser = local_parser_full_dir:gsub('^' .. install_dir .. '/parser/', ''):gsub('%.so$', '')
					if not vim.tbl_contains(ensure_installed, local_parser) then
						require('nvim-treesitter').uninstall(local_parser)
					end
				end
			end,
			once = true
		})

		-- parser enable
		local pattern_filetype = {}
		for _, parser in ipairs(ensure_installed) do
			local has_parser, _ = pcall(vim.treesitter.language.inspect, parser)
			if has_parser then
				local parser_filetypes = vim.treesitter.language.get_filetypes(parser)
				for _, parser_filetype in ipairs(parser_filetypes) do
					if not vim.tbl_contains(pattern_filetype, parser_filetype) then
						table.insert(pattern_filetype, parser_filetype)
					end
				end
			end
		end
		vim.api.nvim_create_autocmd('FileType', {
			group = treesitter_augroup,
			pattern = pattern_filetype,
			callback = function()
				vim.treesitter.start()
				vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
				vim.wo[0][0].foldmethod = 'expr'
			end
		})
	end
}
