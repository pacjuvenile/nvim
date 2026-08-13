local treesitter_configs = {}
local lsp_configs = {}

local lua_dir = vim.fn.stdpath('config') .. '/lua'
local langs_config_full_dir = vim.fn.glob(lua_dir .. '/custom/languages/**/*.lua', false, true)
for _, lang_config_full_dir in ipairs(langs_config_full_dir) do
	local lang_config_module = lang_config_full_dir:gsub('^' .. lua_dir .. '/', '')
		:gsub('%.lua$', '')
		:gsub('/', '%.')
	if lang_config_module ~= 'custom.languages.init' then
		local ok, lang_config = pcall(require, lang_config_module)
		if ok and type(lang_config) == 'table' then
			-- treesitter配置表
			local treesitter = lang_config.treesitter
			table.insert(treesitter_configs, treesitter)
			-- language server配置表
			local lsp = lang_config.lsp
			table.insert(lsp_configs, lsp)
		end
	end
end

return {
	treesitter_configs = treesitter_configs,
	lsp_configs = lsp_configs
}
