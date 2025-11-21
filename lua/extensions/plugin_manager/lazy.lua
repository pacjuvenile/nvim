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
    local plugin_config = plugin_config_full_dir:gsub("^" .. lua_path .. "/", ""):gsub("%.lua$", "")
    -- 插件卸载
    if require(plugin_config).ensure_installed == false then
        local plugin_name = require(plugin_config).name or require(plugin_config).url:gsub("^.*/", "")
        local plugin_path = vim.fn.stdpath("data") .. "/lazy/" .. plugin_name
        if (vim.uv or vim.loop).fs_stat(plugin_path) then
            vim.fn.system({
                "rm",
                "-rf",
                plugin_path
            })
        end
    else
        -- 插件安装
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
        if require(plugin_config).enabled == false then
            plugin_spec.lazy = true
        else
            plugin_spec.lazy = require(plugin_config).lazy
            plugin_spec.ft = require(plugin_config).ft
            plugin_spec.cmd = require(plugin_config).cmd
            plugin_spec.keys = require(plugin_config).keys
            plugin_spec.event = require(plugin_config).event
            -- 插件配置
            plugin_spec.init = require(plugin_config).init
            plugin_spec.config = require(plugin_config).config
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
