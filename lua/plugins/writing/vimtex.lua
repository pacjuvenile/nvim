local M = {}

M.ensure_installed = true
M.url = "https://github.com/lervag/vimtex"

M.enabled = true
M.lazy = false
-- M.ft = "tex"

M.init = function()
  vim.g.vimtex_mappings_enabled = 0
  vim.keymap.set("n", "<localleader>ll", [[<CMD>VimtexCompile<CR>]],
    { silent = true, desc = "Vimtex toggle compilation" })
  vim.keymap.set("n", "<localleader>le", [[<CMD>VimtexErrors<CR>]],
    { silent = true, desc = "Vimtex toggle quickfix window" })
  vim.keymap.set("n", "<localleader>lc", [[<CMD>VimtexClean<CR>]], { silent = true, desc = "Vimtex clean auxiliary" })
  vim.keymap.set("n", "<localleader>lv", [[<CMD>VimtexView<CR>]], { silent = true, desc = "Vimtex forward search" })

  vim.g.vimtex_quickfix_open_on_warning = 0

  vim.g.vimtex_view_method = "sioyek"
  vim.g.vimtex_view_sioyek_exe = "sioyek.exe"
end

return M
