local ts_configs = {}
local ls_configs = {}

local lua_dir = vim.fn.stdpath("config") .. "/lua"
local langs_config_full_dir = vim.fn.glob(lua_dir .. "/languages/**/*.lua", false, true)
for _, lang_config_full_dir in ipairs(langs_config_full_dir) do
  local lang_config_module = lang_config_full_dir:gsub("^" .. lua_dir .. "/", ""):gsub("%.lua$", "")
  local lang_config = require(lang_config_module)
  -- treesitter配置表
  local ts_config = lang_config.ts_config
  table.insert(ts_configs, ts_config)
  -- language server配置表
  local ls_config = lang_config.ls_config
  table.insert(ls_configs, ls_config)
end

return {
  ts_configs = ts_configs,
  ls_configs = ls_configs
}

-- language servers配置
-- for _, ls_config in ipairs(ls_configs) do
--   -- 配置lsp
--   if ls_config.name ~= nil then
--     vim.lsp.config(ls_config.name, ls_config)
--     -- 启用lsp
--     if ls_config.enabled ~= false then
--       vim.lsp.enable(ls_config.name)
--     end
--   end
-- end
