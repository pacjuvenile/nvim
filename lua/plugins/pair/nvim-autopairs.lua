local M = {}

M.ensure_installed = true
M.enabled = true

function M.setup()
    require("nvim-autopairs").setup({})
end

M.config = {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = M.setup
}

if M.ensure_installed then
    M.config.enabled = M.enabled 
    return M.config
end

return {}
