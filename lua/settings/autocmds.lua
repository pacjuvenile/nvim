-- 输入法调整
-- local im_augroup = vim.api.nvim_create_augroup("ImAugroup", { clear = true })
-- vim.api.nvim_create_autocmd("InsertLeave", {
--     group = im_augroup,
--     callback = function()
--         vim.cmd([[silent !/mnt/c/Users/sunny/app/im-select/im-select.exe 1033]])
--     end
-- })
--
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   group = im_augroup,
--   callback = function()
--     vim.cmd([[silent !/mnt/c/Users/sunny/app/im-select/im-select.exe 2052]])
--   end
-- })

-- 打开文件保留上次光标位置
local view_augroup = vim.api.nvim_create_augroup("ViewAugroup", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = view_augroup,
    callback = function()
        if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
            vim.cmd([[normal! `"]])
        end
    end
})
