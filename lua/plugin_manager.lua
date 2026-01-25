-- lazy.nvim安装
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim",
    "--branch=stable",
    lazy_path
  })
end
vim.opt.rtp:prepend(lazy_path)

-- 插件管理
local plugin_specs = {}

local lua_dir = vim.fn.stdpath("config") .. "/lua"
local plugins_config_full_dir = vim.fn.glob(lua_dir .. "/plugins/**/*.lua", false, true)
for _, plugin_config_full_dir in ipairs(plugins_config_full_dir) do
  local plugin_spec = {}
  local plugin_config_module = plugin_config_full_dir:gsub("^" .. lua_dir .. "/", ""):gsub("%.lua$", "")
  local plugin_config = require(plugin_config_module)
  -- 组单个插件配置规格表
  if plugin_config.ensure_installed ~= false then
    plugin_spec.url = plugin_config.url
    plugin_spec.name = plugin_config.name
    plugin_spec.branch = plugin_config.branch
    plugin_spec.commit = plugin_config.commit
    plugin_spec.tag = plugin_config.tag
    plugin_spec.version = plugin_config.version
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
    -- 合并插件配置规格表
    table.insert(plugin_specs, plugin_spec)
  end
end
require("lazy").setup({
  -- 应用插件配置规格表
  spec = plugin_specs,
  rocks = {
    enabled = false
  },
  install = {
    colorscheme = { "catppuccin-macchiato" }
  },
  ui = {
    border = "rounded"
  },
  performance = {
    rtp = {
      disabled_plugins = {
        -- 统一编辑器格式插件
        "editorconfig",
        -- 打开归档文件内置插件
        "gzip",
        "tarPlugin",
        "zigPlugin",
        -- 手册/教程查看插件
        "man",
        "tutor",
        -- 匹配插件
        "matchit",
        "matchparen",
        -- 文件浏览器
        "netrwPlugin",
        -- 拼写检查
        "spellfile",
        -- 代码转html
        "tohtml",
        -- 远程编辑
        -- "net",
        -- "osc52",
        -- 旧插件兼容
        -- "rplugin"
      }
    }
  }
})

-- 插件清理
require("lazy").clean({ wait = true, show = false })
