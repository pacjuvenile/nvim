local M = {}

M.ensure_installed = true
M.enabled = true

function M.config()
    require("ibl").setup({})
end

M.spec = {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "VeryLazy",
    config = M.config
}

if M.ensure_installed then
    M.spec.enabled = M.enabled
    return M.spec
end

return {}
