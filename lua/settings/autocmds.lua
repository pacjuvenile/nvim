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

-- 文件更新则立即保存
local autosave_augroup = vim.api.nvim_create_augroup("TexAutosave", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    group = autosave_augroup,
    callback = function()
        vim.defer_fn(function()
            vim.cmd("silent! write")
        end, 100)
    end,
})
