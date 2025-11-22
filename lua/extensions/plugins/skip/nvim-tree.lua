local M = {}

M.ensure_installed = true
M.url = "https://github.com/nvim-tree/nvim-tree.lua"
M.dependencies = {
    {
        url = "https://github.com/nvim-tree/nvim-web-devicons"
    }
}

M.lazy = true
M.keys = {
    { "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Nvimtree toggle" }
}

M.config = function()
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

return M
