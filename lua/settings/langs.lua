local M = {}

local lua_dir = vim.fn.stdpath("config") .. "/lua"
local langs_config_full_dir = vim.fn.glob(lua_dir .. "/languages/**/*.lua", false, true)
for _, lang_config_full_dir in ipairs(langs_config_full_dir) do
  local lang_config_module = lang_config_full_dir:gsub("^" .. lua_dir .. "/", ""):gsub("%.lua$", "")
  table.insert(M, require(lang_config_module))
end

return M
