local M = {}

M.ensure_installed = true
M.enabled = true

M.config = function()
    require("nvim-surround").setup({})
end

M.spec = {
    "kylechui/nvim-surround",
    lazy = true,
    event = "VeryLazy",
    config = M.config,
    enabled = M.enabled
}

return M
