local M = {}

M.ts_config = {
  parser = { "yaml" }
}

local yaml_augroup = vim.api.nvim_create_augroup("Yaml", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = yaml_augroup,
  pattern = "yaml",
  callback = function ()
    vim.wo[0][0].foldlevel = 0
  end
})


return M
