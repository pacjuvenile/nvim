local M = {}

M.ensure_installed = true
M.enabled = true

M.setup = function()
    require("grug-far").setup({})
end

M.config = {
    "MagicDuck/grug-far.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    cmd = "GrugFar",
    config = M.setup
}

if M.ensure_installed then
    M.config.enabled = M.enabled
    return M.config
end

return {}
