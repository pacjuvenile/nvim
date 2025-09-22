-- 选项设置
require("core.options")

-- 插件管理
require("config.lazy")

-- 键位配置
require("core.keymaps")

-- 输入法调整
local ime_autogroup = vim.api.nvim_create_augroup("ImeAutoGroup", { clear = true })

vim.api.nvim_create_autocmd("InsertLeave", {
  group = ime_autogroup,
  callback = function ()
    vim.cmd(":silent :!/mnt/c/Users/sunny/app/im-select/im-select.exe 1033")
  end
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = ime_autogroup,
  callback = function ()
    vim.cmd(":silent :!/mnt/c/Users/sunny/app/im-select/im-select.exe 2052")
  end
})
