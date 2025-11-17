local M = {}

M.ensure_installed = true
M.enabled = true

M.config = function()
    require("grug-far").setup({
        windowCreationCommand = ""
    })
end

M.spec = {
    "MagicDuck/grug-far.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    cmd = "GrugFar",
    config = M.config
}

if M.ensure_installed then
    M.spec.enabled = M.enabled
    return M.spec
end

return {}
