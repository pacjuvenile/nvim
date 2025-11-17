local M = {}

M.ensure_installed = true
M.enabled = true

function M.config()
    require("nvim-autopairs").setup({})
end

M.spec = {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = M.config,
    enabled = M.enabled
}

return M
