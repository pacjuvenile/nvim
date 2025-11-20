local M = {}

M.ensure_installed = true
M.enabled = true

-- function M.config()
--     require("ibl").setup({})
-- end

M.spec = {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "VeryLazy",
    config = M.config,
    enabled = M.enabled
}

return M
