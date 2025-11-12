local M = {}

M.ensure_installed = true
M.enabled = true

M.setup = function()
    require("nvim-surround").setup({})
end

M.config = {
    "kylechui/nvim-surround",
    lazy = true,
    event = "VeryLazy",
    config = M.setup
}

if M.ensure_installed then
    M.config.enabled = M.enabled 
    return M.config
end

return {}
