local M = {}

M.ensure_installed = true

M.setup = function()
    require("grug-far").setup()
end

M.config = {
    "MagicDuck/grug-far.nvim",
    lazy = true,
    cmd = "GrugFar",
    config = M.setup
}

if M.ensure_installed then
    return M.config
end

return {}
