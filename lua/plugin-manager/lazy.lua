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
local plugins_config_full_dir = vim.fn.glob(plugins_config_path .. "/**/*.lua", false, true)

for _, plugin_config_full_dir in ipairs(plugins_config_full_dir) do
    local plugin_spec = {}
    local plugin_config = plugin_config_full_dir:gsub("^" .. lua_path .. "/", ""):gsub("%.lua$", "")
    -- 插件安装
    plugin_spec.enabled = require(plugin_config).ensure_installed
    plugin_spec.url = require(plugin_config).url
    plugin_spec.branch = require(plugin_config).branch
    plugin_spec.tag = require(plugin_config).tag
    plugin_spec.commit = require(plugin_config).commit
    plugin_spec.version = require(plugin_config).version
    plugin_spec.dir = require(plugin_config).dir
    plugin_spec.name = require(plugin_config).name
    plugin_spec.build = require(plugin_config).build
    plugin_spec.dependencies = require(plugin_config).dependencies
    -- 插件加载
    plugin_spec.lazy = require(plugin_config).lazy
    plugin_spec.ft = require(plugin_config).ft
    plugin_spec.cmd = require(plugin_config).cmd
    plugin_spec.keys = require(plugin_config).keys
    plugin_spec.event = require(plugin_config).event
    -- 插件配置
    plugin_spec.init = require(plugin_config).init
    plugin_spec.config = require(plugin_config).config
    -- 组配置规格表
    spec_table[#spec_table + 1] = plugin_spec
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
-- local configured_plugins = { ["lazy.nvim"] = true }
-- local function get_configured_plugins(spec)
--     local plugin_name = nil
--     if type(spec) == "string" then
--         plugin_name = spec:gsub("^.*/", "")
--     elseif spec.name ~= nil then
--         plugin_name = spec.name
--     elseif next(spec) ~= nil then
--         plugin_name = spec[1]:gsub("^.*/", "")
--     end
--     if plugin_name ~= nil then
--         configured_plugins[plugin_name] = true
--     end
--     -- 处理依赖
--     if spec.dependencies ~= nil then
--         for _, dependency in ipairs(spec.dependencies) do
--             get_configured_plugins(dependency)
--         end
--     end
-- end
-- for _, spec in ipairs(spec_table) do
--     get_configured_plugins(spec)
-- end
-- -- 获取本地已安装的插件
-- local plugins_path = vim.fn.stdpath("data") .. "/lazy"
-- local plugins = vim.fn.readdir(plugins_path)
-- -- 若本地已安装的插件未被配置，则卸载之
-- for _, plugin in ipairs(plugins) do
--     if configured_plugins[plugin] ~= true then
--         vim.api.nvim_create_autocmd("User", {
--             pattern = "VeryLazy",
--             callback = function()
--                 require("lazy.manage").clean({ show = false })
--             end
--         })
--     end
-- end
