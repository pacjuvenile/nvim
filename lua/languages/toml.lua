local M = {}

M.ts_config = {
  parser = { "toml" }
}

local toml_augroup = vim.api.nvim_create_augroup("Toml", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = toml_augroup,
  pattern = "toml",
  callback = function ()
    vim.wo[0][0].foldlevel = 0
  end
})


return M
