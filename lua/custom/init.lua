-- 字符编码
vim.cmd('language en_US.UTF-8')
vim.g.encoding = 'UTF-8'

-- 剪切板
vim.g.clipboard = 'osc52'
if vim.fn.has('wsl') == 1 then
	vim.g.clipboard = {
		name = 'win32yank',
		copy = {
			['+'] = 'win32yank.exe -i --crlf'
		},
		paste = {
			['+'] = 'win32yank.exe -o --lf'
		},
		cache_enabled = 0
	}
end

-- 全局映射
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- 关闭内置缩进
vim.cmd('filetype indent off')

-- 选项设置
require('custom.core.options')
-- 插件管理
require('custom.core.plugin-manager')
-- 自动命令
require('custom.core.autocmds')
-- 键位配置
require('custom.core.keymaps')
-- 语言设置
require('custom.core.lsp')
