local ls_configs = require('custom.languages').ls_configs
for _, ls_config in ipairs(ls_configs) do
	-- 配置lsp
	if ls_config.name ~= nil then
		vim.lsp.config(ls_config.name, ls_config)
		-- 启用lsp
		if ls_config.enabled ~= false then
			vim.lsp.enable(ls_config.name)
		end
	end
end

local lsp_augroup = vim.api.nvim_create_augroup('Lsp', { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
	group = lsp_augroup,
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		-- 重命名
		vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { silent = true, buffer = ev.buf, desc = 'Lsp rename' } )
		-- 查找引用
		vim.keymap.set('n', 'grr', vim.lsp.buf.references, { silent = true, buffer = ev.buf, desc = 'Lsp references' })

		-- 跳转定义
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, buffer = ev.buf, desc = 'Lsp definition' })

		-- 折叠与格式化
		if client and client:supports_method('textDocument/foldingRange') then
			vim.wo[0][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
		end
		vim.keymap.set('n', 'gf', vim.lsp.buf.format, { silent = true, buffer = ev.buf, desc = 'Lsp format' })

		-- 诊断配置
		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = true
		})
		vim.keymap.set('n', 'go', function()
			vim.diagnostic.open_float({ source = true })
		end)
	end
})
