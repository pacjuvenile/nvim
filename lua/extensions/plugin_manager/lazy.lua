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
local plugins_config_path = lua_path .. "/extensions/plugins"
local plugins_config_full_dir = vim.fn.glob(plugins_config_path .. "/**/*.lua", false, true)

for _, plugin_config_full_dir in ipairs(plugins_config_full_dir) do
    local plugin_spec = {}
    local plugin_config_module = plugin_config_full_dir:gsub("^" .. lua_path .. "/", ""):gsub("%.lua$", "")
    local plugin_config = require(plugin_config_module)
    -- 插件卸载
    if plugin_config.ensure_installed == false then
        local plugin_name = plugin_config.name or plugin_config.url:gsub("^.*/", "")
        local plugin_path = vim.fn.stdpath("data") .. "/lazy/" .. plugin_name
        if (vim.uv or vim.loop).fs_stat(plugin_path) then
            vim.fn.system({
                "rm",
                "-rf",
                plugin_path
            })
        end
        -- 依赖卸载
        local function recursively_remove_dependencies(dependencies)
            if dependencies ~= nil then
                for _, dependency in ipairs(dependencies) do
                    local dependency_name = dependency.name or dependency.url:gsub("^.*/", "")
                    local dependency_path = vim.fn.stdpath("data") .. "/lazy/" .. dependency_name
                    if (vim.uv or vim.loop).fs_stat(dependency_path) then
                        vim.fn.system({
                            "rm",
                            "-rf",
                            dependency_path
                        })
                    end

                    -- 递归地处理依赖
                    recursively_remove_dependencies(dependency.dependencies)
                end
            end
        end
        local dependencies = plugin_config.dependencies
        recursively_remove_dependencies(dependencies)
    else
        -- 插件安装
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
