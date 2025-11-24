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
local ensure_removed = {}
local ensure_installed = {}

local lua_path = vim.fn.stdpath("config") .. "/lua"
local plugins_config_full_dir = vim.fn.glob(lua_path .. "/extensions/plugins/**/*.lua", false, true)
for _, plugin_config_full_dir in ipairs(plugins_config_full_dir) do
    local plugin_spec = {}
    local plugin_config_module = plugin_config_full_dir:gsub("^" .. lua_path .. "/", ""):gsub("%.lua$", "")
    local plugin_config = require(plugin_config_module)
    local plugin_name = plugin_config.name or plugin_config.url:gsub("^.*/", "")
    -- 插件卸载
    if plugin_config.ensure_installed == false then
        ensure_removed[plugin_name] = true
    else
        ensure_installed[plugin_name] = true
        plugin_spec.url = plugin_config.url
        plugin_spec.branch = plugin_config.branch
        plugin_spec.tag = plugin_config.tag
        plugin_spec.commit = plugin_config.commit
        plugin_spec.version = plugin_config.version
        plugin_spec.dir = plugin_config.dir
        plugin_spec.name = plugin_config.name
        plugin_spec.build = plugin_config.build
        plugin_spec.dependencies = plugin_config.dependencies
        -- 插件加载
        if plugin_config.enabled == false then
            plugin_spec.lazy = true
        else
            plugin_spec.lazy = plugin_config.lazy
            plugin_spec.ft = plugin_config.ft
            plugin_spec.cmd = plugin_config.cmd
            plugin_spec.keys = plugin_config.keys
            plugin_spec.event = plugin_config.event
            -- 插件配置
            plugin_spec.init = plugin_config.init
            plugin_spec.config = plugin_config.config
        end
        -- 组配置规格表
        spec_table[#spec_table + 1] = plugin_spec
    end

    local function ensure_dependency_installed(dependencies)
        if dependencies ~= nil then
            for _, dependency in ipairs(dependencies) do
                local dependency_name = dependency.name or dependency.url:gsub("^.*/", "")
                if plugin_config.ensure_installed == false then
                    ensure_removed[dependency_name] = true
                else
                    ensure_installed[dependency_name] = true
                end
                ensure_dependency_installed(dependency.dependencies)
            end
        end
    end
    ensure_dependency_installed(plugin_config.dependencies)
end

for plugin, _ in pairs(ensure_removed) do
    if ensure_installed[plugin] == nil then
        local plugin_path = vim.fn.stdpath("data") .. "/lazy/" .. plugin
        if (vim.uv or vim.loop).fs_stat(lazypath) then
            vim.fn.system({
                "rm",
                "-rf",
                plugin_path
            })
        end
    end
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
