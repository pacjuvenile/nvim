vim.keymap.set("n", "j", [[v:count == 0 ? "gj" : "j"]], { expr = true, noremap = true }) -- 视觉行下移
vim.keymap.set("n", "k", [[v:count == 0 ? "gk" : "k"]], { expr = true, noremap = true }) -- 视觉行上移
vim.keymap.set("i", "<A-l>", [[<Right>]], { noremap = true })                            -- 替换方向键右移
vim.keymap.set("i", "<A-h>", [[<Left>]], { noremap = true })                             -- 替换方向键左移
vim.keymap.set("i", "<A-k>", [[<Up>]], { noremap = true })                               -- 替换方向键上移
vim.keymap.set("i", "<A-j>", [[<Down>]], { noremap = true })                             -- 替换方向键下移
vim.keymap.set("n", "H", [[<CMD>:bp<CR>]], { noremap = true })  -- 移动至上一个buffer
vim.keymap.set("n", "L", [[<CMD>:bn<CR>]], { noremap = true })  -- 移动至下一个buffer

vim.keymap.set({ "n", "v" }, "y", [["+y]], { noremap = true })                           -- 复制
vim.keymap.set("v", "x", [["+x]], { noremap = true })                                    -- 剪切
vim.keymap.set({ "n", "v" }, "p", [["+p]], { noremap = true })                           -- 粘贴

vim.keymap.set("n", ":", [[q:i]], { noremap = true })                                    -- 进入命令窗口
vim.keymap.set("n", "<Esc>", function()
    if vim.fn.getcmdwintype() ~= "" and vim.fn.mode() == "n" then
        return [[<C-c><C-c>]]   -- 退出命令窗口
    elseif vim.fn.mode() == "n" then
        return [[<CMD>nohl<CR>]]  -- 取消高亮
    end
end, { expr = true, noremap = true })

vim.keymap.set("n", "<A-f>", "<CMD>lua vim.lsp.buf.format()<CR>", { desc = "Use lsp to format current buffer" })

vim.keymap.set("n", "<A-m>", [[:%s.\r..g<CR>]], { noremap = true, silent = true }) -- 删除Windows风格的换行符
vim.keymap.set("n", "<A-r>", "<CMD>silent !/mnt/c/Users/sunny/app/Rime/weasel-0.17.4/WeaselDeployer.exe /deploy<CR>")
