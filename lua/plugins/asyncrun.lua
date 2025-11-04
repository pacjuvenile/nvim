local M = {}

M.ensure_installed = true

M.config = {
    "skywind3000/asyncrun.vim",
    lazy = true,
    event = "VeryLazy"
}

if M.ensure_installed then
    return M.config
end

return {}
