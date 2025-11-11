local M = {}

M.ensure_installed = true
M.enabled = true

M.setup = function()
    require("nvim-tree").setup({
        view = {
            side = "right"
        },
        git = {
            enable = true
        },
        filters = {
            git_ignored = false,
        }
    })
end

M.config = {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    keys = {
        { "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Nvimtree toggle" }
    },
    config = M.setup
}

if M.ensure_installed then
    M.config.enabled = M.enabled
    return M.config
end

return {}
