local M = {}

M.ensure_installed = true
M.enabled = true

function M.config()
    require("nvim-autopairs").setup({})
end

M.spec = {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = M.config
}

if M.ensure_installed then
    M.spec.enabled = M.enabled 
    return M.spec
end

return {}
