-- lazy.nvim安装
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- 插件管理
local spec_table = {}

local lua_path = vim.fn.stdpath("config") .. "/lua"
local plugins_config_path = lua_path .. "/plugins"
local plugins_config = vim.fn.glob(plugins_config_path .. "/**/*.lua", false, true)

for _, plugin_config in ipairs(plugins_config) do
    local lua_path_file = plugin_config:gsub("^" .. lua_path .. "/", "")
    local plugin_config_module = lua_path_file:gsub("/", "."):gsub("%.lua$", "")
    spec_table[#spec_table + 1] = require(plugin_config_module)
end

require("lazy").setup({
    spec = spec_table,
    ui = {
        border = "rounded"
    },
    install = {
        colorscheme = { "catppuccin-macchiato" }
    }
})

-- 自动清理未配置插件
-- 获取已配置的插件及其依赖
local configured_plugins = { ["lazy.nvim"] = true }
local function get_configured_plugins(spec)
    local plugin_name = nil
    if type(spec) == "string" then
        plugin_name = spec:gsub("^.*/", "")
    elseif spec.name ~= nil then
        plugin_name = spec.name
    elseif next(spec) ~= nil then
        plugin_name = spec[1]:gsub("^.*/", "")
    end
    if plugin_name ~= nil then
        configured_plugins[plugin_name] = true
    end
    -- 处理依赖
    if spec.dependencies ~= nil then
        for _, dependency in ipairs(spec.dependencies) do
            get_configured_plugins(dependency)
        end
    end
end
for _, spec in ipairs(spec_table) do
    get_configured_plugins(spec)
end
-- 获取本地已安装的插件
local plugins_path = vim.fn.stdpath("data") .. "/lazy"
local plugins = vim.fn.readdir(plugins_path)
-- 若本地已安装的插件未被配置，则卸载之
for _, plugin in ipairs(plugins) do
    if configured_plugins[plugin] ~= true then
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                require("lazy.manage").clean({ show = false })
            end
        })
    end
end
