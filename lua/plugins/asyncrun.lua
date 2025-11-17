local M = {}

M.ensure_installed = true
M.enabled = true

M.spec = {
    "skywind3000/asyncrun.vim",
    lazy = true,
    event = "VeryLazy"
}

if M.ensure_installed then
    M.spec.enabled = M.enabled
    return M.spec
end

return {}
