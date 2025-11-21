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
