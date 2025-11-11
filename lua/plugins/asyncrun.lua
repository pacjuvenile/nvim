local M = {}

M.ensure_installed = true
M.enabled = true

M.config = {
    "skywind3000/asyncrun.vim",
    lazy = true,
    event = "VeryLazy"
}

if M.ensure_installed then
    M.config.enabled = M.enabled
    return M.config
end

return {}
