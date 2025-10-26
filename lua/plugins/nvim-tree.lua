local M = {}

M.setup = function()
    require("nvim-tree").setup({
        git = { 
            enable = true 
        },
        filters = {
            git_ignored = false,
        }
    })
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    keys = {
        { "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Nvimtree toggle" }
    },
    config = function()
        M.setup()
    end
}
