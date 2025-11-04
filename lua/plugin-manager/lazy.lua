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
require("lazy").setup({
    spec = plugins_spec(),
    ui = {
        border = "rounded"
    },
    install = {
        colorscheme = {
            "catppuccin-macchiato"
        }
    }
})
