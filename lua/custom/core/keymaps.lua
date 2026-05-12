vim.keymap.set('n', 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true }) -- 视觉行下移
vim.keymap.set('n', 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true }) -- 视觉行上移
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set({ 'n', 'v' }, 'y', [["+y]])                               -- 复制
vim.keymap.set('v', 'x', [["+x]])                                        -- 剪切
vim.keymap.set({ 'n', 'v' }, 'p', [["+p]])                               -- 下一行粘贴
vim.keymap.set({ 'n', 'v' }, 'P', [["+P]])                               -- 上一行粘贴

vim.keymap.set({ 'n', 'v' }, ':', [[q:]])                                -- 进入命令窗口
vim.keymap.set('n', '<Esc>', function()
	if vim.fn.getcmdwintype() ~= '' and vim.fn.mode() == 'n' then
		return [[<C-c><C-c>]]       -- 退出命令窗口
	elseif vim.fn.mode() == 'n' then
		return [[<C-l><Cmd>nohl<cr>]] -- 取消高亮
	end
end, { expr = true, silent = true })

vim.keymap.set('n', '<C-A-m>', [[<Cmd>%s.\r..g<cr>]], { silent = true }) -- 删除Windows风格的换行符
