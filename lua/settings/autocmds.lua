-- 打开文件保留上次光标位置
local view_augroup = vim.api.nvim_create_augroup("View", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = view_augroup,
  callback = function()
    if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("normal! `\"")
    end
  end
})

-- 普通文件更新则立即保存
local save_augroup = vim.api.nvim_create_augroup("Save", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  group = save_augroup,
  callback = function()
    if vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.defer_fn(function()
        vim.cmd("silent! write")
      end, 100)
    end
  end
})
