local M = {}

M.ensure_installed = false

M.setup = function()
        require("grug_far").setup()
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
