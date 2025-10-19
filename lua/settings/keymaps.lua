vim.keymap.set("n", "j", [[v:count == 0 ? "gj" : "j"]], { expr = true, noremap = true }) -- 视觉行下移
vim.keymap.set("n", "k", [[v:count == 0 ? "gk" : "k"]], { expr = true, noremap = true }) -- 视觉行上移
vim.keymap.set("i", "<A-l>", [[<Right>]], { noremap = true })                            -- 替换方向键右移
vim.keymap.set("i", "<A-h>", [[<Left>]], { noremap = true })                             -- 替换方向键左移
vim.keymap.set("i", "<A-k>", [[<Up>]], { noremap = true })                               -- 替换方向键上移
vim.keymap.set("i", "<A-j>", [[<Down>]], { noremap = true })                             -- 替换方向键下移

vim.keymap.set({ "n", "v" }, "y", [["+y]], { noremap = true })                           -- 复制
vim.keymap.set("v", "x", [["+x]], { noremap = true })                                    -- 剪切
vim.keymap.set({ "n", "v" }, "p", [["+p]], { noremap = true })                           -- 粘贴
vim.keymap.set("i", "<A-p>", [[<C-r>+<Esc>]], { noremap = true })                        -- 插入模式粘贴

vim.keymap.set("n", ":", [[q:i]], { noremap = true })                                    -- 进入命令窗口
vim.keymap.set("i", "<A-n>", function()
    if vim.fn.getcmdwintype() ~= "" then
        return "<Esc>" -- 命令窗口返回普通模式
    elseif vim.bo.buftype == "terminal" then
        return "<Esc>" -- 终端窗口返回普通模式
    end
end, { expr = true, noremap = true })
vim.keymap.set({ "t", "n", "i" }, "<Esc>", function()
    if vim.fn.getcmdwin ~= "" then
        return "<C-c><C-c>"    -- 退出命令窗口
    elseif vim.bo.buftype == "terminal" then
        return "<C-\\><C-n>"
    elseif vim.fn.mode() == "n" then
        return "<CMD>nohl<CR>" -- 取消高亮
    else
        return "<Esc>"         -- 返回普通模式
    end
end, { expr = true, noremap = true })

vim.keymap.set("n", "<A-m>", [[:%s.\r..g<CR>]], { noremap = true, silent = true }) -- 删除Windows风格的换行符
