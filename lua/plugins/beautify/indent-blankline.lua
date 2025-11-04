local M = {}

M.ensure_installed = true

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
    return M.config
end

return {}
