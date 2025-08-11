vim.g.mapleader = " "   -- 设置引导符为空格 

vim.keymap.set("n", "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true, noremap = true })    -- 视觉行下移
vim.keymap.set("n", "k", [[v:count ==0 ? 'gk' : 'k']], { expr = true, noremap = true })    -- 视觉行上移
vim.keymap.set("i", "<A-l>", [[<Right>]], { noremap = true })  -- 替换方向键右移
vim.keymap.set("i", "<A-h>", [[<Left>]], { noremap = true })  -- 替换方向键左移

vim.keymap.set("v", "y", [["+y]], { noremap = true })           -- 复制
vim.keymap.set("v", "x", [["+x]], { noremap = true })           -- 剪切
vim.keymap.set({ "n", "v" }, "p", [["+p]], { noremap = true })  -- 粘贴

vim.keymap.set("n", ":", "q:i", { noremap = true })                 -- 进入命令窗口
vim.keymap.set({ "n", "i" }, "<leader><leader>", [[<C-c><C-c>]], { noremap = true })    -- 退出命令窗口

vim.keymap.set("n", "<Esc>", [[:nohl<CR>]], { noremap = true, silent = true })  -- 取消高亮

vim.keymap.set("n", "<leader>m", [[:%s.\r..g<CR>]], { noremap = true, silent = true })  -- 删除Windows风格的换行符
