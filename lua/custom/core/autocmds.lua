local view_augroup = vim.api.nvim_create_augroup('View', { clear = true })
-- 打开文件保留上次光标位置
vim.api.nvim_create_autocmd('BufReadPost', {
  group = view_augroup,
  callback = function()
    if vim.bo.buftype == '' and vim.fn.expand('%') ~= '' then
      vim.cmd('normal! `\"')
    end
  end
})

local save_augroup = vim.api.nvim_create_augroup('Save', { clear = true })
-- 普通文件更新则立即保存
vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  group = save_augroup,
  callback = function()
    if vim.bo.buftype == '' and vim.fn.expand('%') ~= '' then
      vim.defer_fn(function()
        vim.cmd('silent! write')
      end, 100)
    end
  end
})

local cmd_augroup = vim.api.nvim_create_augroup('Cmd', { clear = true })
-- 进入命令行窗口即进入插入模式
vim.api.nvim_create_autocmd('CmdwinEnter', {
  group = cmd_augroup,
  callback = function()
    vim.cmd('startinsert!')
    vim.wo.number = false
    vim.wo.relativenumber = false
  end
})

-- local buffer_augroup = vim.api.nvim_create_augroup('Buffer', { clear = true })
-- -- 切换回已缓存的buffer时根目录同时切换
-- local buf_cwd = {}
-- vim.api.nvim_create_autocmd('BufWinEnter', {
-- 	group = buffer_augroup,
-- 	callback = function(event)
-- 		local bufnr = event.buf
-- 		local buftype = vim.api.nvim_get_option_value('buftype', { buf = bufnr })
-- 		local bufname = vim.api.nvim_buf_get_name(bufnr)
-- 		if buftype == '' and bufname ~= '' then
-- 			if buf_cwd[bufnr] then
-- 				vim.fn.chdir(buf_cwd[bufnr])
-- 			else
-- 				buf_cwd[bufnr] = vim.fn.getcwd()
-- 			end
-- 		end
-- 	end
-- })
