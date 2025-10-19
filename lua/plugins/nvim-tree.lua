return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    keys = {
        { "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Nvimtree toggle" }
    },
    opts = {
        actions = {
            open_file = {
                quit_on_open = true
            }
        }
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)
    end
}
