local lsp_configs = require('custom.languages').lsp_configs
for _, lsp in ipairs(lsp_configs) do
	-- 配置lsp
	if lsp.name ~= nil then
		vim.lsp.config(lsp.name, lsp)
		-- 启用lsp
		if lsp.enabled ~= false then
			vim.lsp.enable(lsp.name)
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

		-- 格式化
		vim.keymap.set('n', 'gf', vim.lsp.buf.format, { silent = true, buffer = ev.buf, desc = 'Lsp format' })

		-- 折叠
		if client and client:supports_method('textDocument/foldingRange') then
			vim.wo[0][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
			vim.wo[0][0].foldmethod = 'expr'
		end

		-- 诊断配置
		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = true
		})
		vim.keymap.set('n', 'go', function()
			vim.diagnostic.open_float({ source = true })
		end, { buffer = ev.buf, desc = 'Lsp diagnostic float' })
	end
})
