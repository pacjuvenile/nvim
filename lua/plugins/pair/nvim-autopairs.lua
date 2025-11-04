local M = {}

M.ensure_installed = true

function M.setup()
    require("nvim-autopairs").setup({})
end

M.config = {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = M.setup
}

if M.ensure_installed then
    return M.config
end

return {}
