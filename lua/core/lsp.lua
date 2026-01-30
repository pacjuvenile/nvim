local ls_configs = require("langs").ls_configs
for _, ls_config in ipairs(ls_configs) do
  -- 配置lsp
  if ls_config.name ~= nil then
    vim.lsp.config(ls_config.name, ls_config)
    -- 启用lsp
    if ls_config.enabled ~= false then
      vim.lsp.enable(ls_config.name)
    end
  end
end

-- 诊断配置
vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true
})

-- 格式化配置
vim.keymap.set("n", "<localleader>f", [[<Cmd>lua vim.lsp.buf.format()<CR>]], { silent = true })                                  -- 基于lsp进行buffer格式化
