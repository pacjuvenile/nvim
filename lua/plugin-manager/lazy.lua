-- lazy.nvim安装
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- 插件管理
local plugins_spec = function()
    local spec_table = {}

    local lua_path = vim.fn.stdpath("config") .. "/lua"
    local plugins_path = lua_path .. "/plugins"
    local plugins_configs = vim.fn.glob(plugins_path .. "/**/*.lua", false, true)

    for _, item in ipairs(plugins_configs) do
        local lua_path_file = item:gsub("^" .. lua_path .. "/", "")
        local plugins_config_module = lua_path_file:gsub("/", "."):gsub("%.lua$", "")
        spec_table[#spec_table + 1] = require(plugins_config_module)
    end
    return spec_table
end

local spec_table = plugins_spec()
require("lazy").setup({
    spec = spec_table,
    ui = {
        border = "rounded"
    },
    install = {
        colorscheme = {
            "catppuccin-macchiato"
        }
    }
})

-- 自动清理未配置插件
-- 获取已配置的插件及其依赖
local configured_plugins = {["lazy.nvim"] = true}
local function get_plugin_name(spec)
    local plugin_name = nil
    if type(spec) == "string" then
        plugin_name = spec:gsub("^.*/","")
    elseif spec.name ~= nil then
        plugin_name = spec.name
    elseif next(spec) ~= nil then
        plugin_name = spec[1]:gsub("^.*/","")
    end
    if plugin_name ~= nil then
        configured_plugins[plugin_name] = true
    end
-- 处理依赖
    if spec.dependencies ~= nil then
        for _, dependency in ipairs(spec.dependencies) do
            get_plugin_name(dependency)
        end
    end
end
for _, spec in ipairs(spec_table) do
    get_plugin_name(spec)
end
-- 获取本地已安装的插件
local plugins_path = vim.fn.stdpath("data") .. "/lazy"
local plugins_data = vim.fn.readdir(plugins_path)
-- 若本地已安装的插件未被配置，则卸载之
for _, plugin in ipairs(plugins_data) do
    if configured_plugins[plugin] ~= true then
        local lazy_augroup = vim.api.nvim_create_augroup("LazyAugroup", { clear = true })
        vim.api.nvim_create_autocmd("User",{
            pattern = "VeryLazy",
            group = lazy_augroup,
            callback = function()
                vim.cmd[[Lazy clean]]
            end
        })
    end
end
