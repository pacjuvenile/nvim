local M = {}

-- M.ts_config = {
--   parser = { "systemverilog" }
-- }

M.ls_config = {
  name = "svls",
  cmd = { "svls" },
  filetypes = { "verilog", "systemverilog" },
  root_markers = { ".git" }
}

return M
