vim.keymap.set("n", "j", [[v:count == 0 ? "gj" : "j"]], { expr = true }) -- 视觉行下移
vim.keymap.set("n", "k", [[v:count == 0 ? "gk" : "k"]], { expr = true }) -- 视觉行上移
vim.keymap.set("i", "<A-h>", [[<Left>]])                                 -- 替换方向键左移
vim.keymap.set("i", "<A-j>", [[<Down>]])                                 -- 替换方向键下移
vim.keymap.set("i", "<A-k>", [[<Up>]])                                   -- 替换方向键上移
vim.keymap.set("i", "<A-l>", [[<Right>]])                                -- 替换方向键右移
vim.keymap.set("n", "H", [[<Cmd>bprevious<CR>]], { silent = true })      -- 切换至上一个buffer
vim.keymap.set("n", "L", [[<Cmd>bnext<CR>]], { silent = true })          -- 切换至下一个buffer

vim.keymap.set({ "n", "v" }, "y", [["+y]])                               -- 复制
vim.keymap.set("v", "x", [["+x]])                                        -- 剪切
vim.keymap.set({ "n", "v" }, "p", [["+p]])                               -- 粘贴

vim.keymap.set("n", ":", [[q:]])                                         -- 进入命令窗口
vim.keymap.set("n", "<Esc>", function()
  if vim.fn.getcmdwintype() ~= "" and vim.fn.mode() == "n" then
    return [[<C-c><C-c>]]         -- 退出命令窗口
  elseif vim.fn.mode() == "n" then
    return [[<C-l><Cmd>nohl<CR>]] -- 取消高亮
  end
end, { expr = true, silent = true })

vim.keymap.set("n", "<C-A-m>", [[<Cmd>%s.\r..g<CR>]], { silent = true }) -- 删除Windows风格的换行符
vim.keymap.set("n", "<C-A-r>", [[<Cmd>silent !/mnt/c/Users/sunny/app/rime/weasel-0.17.4/WeaselDeployer.exe /deploy<CR>]],
  { silent = true })                                                     -- 重新部署rime
