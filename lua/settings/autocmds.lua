-- 输入法调整
local im_autogroup = vim.api.nvim_create_augroup("ImAutoGroup", { clear = true })
vim.api.nvim_create_autocmd("InsertLeave", {
    group = im_autogroup,
    callback = function()
        vim.cmd([[silent !/mnt/c/Users/sunny/app/im-select/im-select.exe 1033]])
    end
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = im_autogroup,
  callback = function()
    vim.cmd([[silent !/mnt/c/Users/sunny/app/im-select/im-select.exe 2052]])
  end
})

-- 打开文件保留上次光标位置
local view_autogroup = vim.api.nvim_create_augroup("ViewAutoGroup", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = view_autogroup,
    callback = function()
        if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
            vim.cmd([[normal! `"]])
        end
    end
})
-- vim.api.nvim_create_autocmd("BufWinLeave", {
--     group = view_autogroup,
--     callback = function()
--         if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
--             vim.cmd([[mkview]])
--         end
--     end
-- })
