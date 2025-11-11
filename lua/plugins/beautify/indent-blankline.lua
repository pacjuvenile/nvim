local M = {}

M.ensure_installed = true
M.enabled = false

function M.setup()
    require("ibl").setup({})
end

M.config = {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "VeryLazy",
    config = M.setup
}

if M.ensure_installed then
    M.config.enabled = M.enabled
    return M.config
end

return {}
