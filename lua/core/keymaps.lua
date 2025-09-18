vim.keymap.set("n", "j", [[v:count == 0 ? "gj" : "j"]], { expr = true, noremap = true })    -- 视觉行下移
vim.keymap.set("n", "k", [[v:count == 0 ? "gk" : "k"]], { expr = true, noremap = true })    -- 视觉行上移
vim.keymap.set("i", "<A-l>", [[<Right>]], { noremap = true })                               -- 替换方向键右移
vim.keymap.set("i", "<A-h>", [[<Left>]], { noremap = true })                                -- 替换方向键左移
vim.keymap.set("i", "<A-k>", [[<Up>]], { noremap = true })                                  -- 替换方向键上移
vim.keymap.set("i", "<A-j>", [[<Down>]], { noremap = true })                                -- 替换方向键下移

vim.keymap.set("n", "<A-S-h>",[[<C-w>h]], { noremap = true }) -- 移至左窗口
vim.keymap.set("n", "<A-S-l>",[[<C-w>l]], { noremap = true }) -- 移至右窗口
vim.keymap.set("n", "<A-S-j>",[[<C-w>j]], { noremap = true }) -- 移至下窗口
vim.keymap.set("n", "<A-S-k>",[[<C-w>k]], { noremap = true }) -- 移至上窗口

vim.keymap.set({ "n", "v"}, "y", [["+y]], { noremap = true })       -- 复制
vim.keymap.set("v", "x", [["+x]], { noremap = true })               -- 剪切
vim.keymap.set({ "n", "v" }, "p", [["+p]], { noremap = true })      -- 粘贴
vim.keymap.set("i", "<A-p>", [[<C-r>+<Esc>]], { noremap = true })   -- 插入模式粘贴

vim.keymap.set("n", ":", [[q:i]], { noremap = true })               -- 进入命令窗口
vim.keymap.set("i", "<Esc>", function ()
  if vim.fn.getcmdwintype() ~= "" then
      return "<C-c><C-c>"
  else
      return "<Esc>"
  end
end, { expr = true, noremap = true })    -- 退出命令窗口

vim.keymap.set("n", "<Esc>", [[:nohl<CR>]], { noremap = true, silent = true })  -- 取消高亮

vim.keymap.set("n", "<leader>m", [[:%s.\r..g<CR>]], { noremap = true, silent = true })  -- 删除Windows风格的换行符
