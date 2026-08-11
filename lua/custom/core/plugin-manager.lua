-- lazy.nvim安装
local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazy_path) then
	local repo = 'https://github.com/folke/lazy.nvim'

	local out = vim.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--branch=stable',
		repo,
		lazy_path
	}):wait()

	if out.code ~= 0 then
		vim.api.nvim_echo({
			{ out.stderr or out.stdout, 'ErrorMsg' },
			{ '\n', 'InfoMsg' }
		}, true, {})
	end
end
vim.opt.rtp:prepend(lazy_path)

-- 插件管理
local plugin_specs = {}

local lua_dir = vim.fn.stdpath('config') .. '/lua'
local plugins_full_dir = vim.fn.glob(lua_dir .. '/custom/plugins/**/*.lua', false, true)
for _, plugin_full in ipairs(plugins_full_dir) do
	local plugin_module = plugin_full:gsub('^' .. lua_dir .. '/', ''):gsub('%.lua$', '')
	local ok, plugin_spec = pcall(require, plugin_module)
	if ok and type(plugin_spec) == 'table' then
		table.insert(plugin_specs, plugin_spec)
	end
end

require('lazy').setup({
	-- 应用插件配置规格表
	spec = plugin_specs,
	rocks = {
		enabled = false
	},
	ui = {
		border = 'rounded',
		backdrop = 85
	},
	performance = {
		rtp = {
			disabled_plugins = {
				-- 统一编辑器格式插件
				'editorconfig',
				-- 打开归档文件内置插件
				'gzip',
				'tarPlugin',
				'zigPlugin',
				-- 手册/教程查看插件
				'man',
				'tutor',
				-- 匹配插件
				'matchit',
				'matchparen',
				-- 文件浏览器
				'netrwPlugin',
				-- 拼写检查
				'spellfile',
				-- 代码转html
				'tohtml',
				-- 远程编辑
				'net',
				-- 旧插件兼容
				'rplugin'
			}
		}
	}
})

-- 插件清理
require('lazy').clean({ wait = true, show = false })
