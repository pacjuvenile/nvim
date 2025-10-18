return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        require("ibl").setup(opts)
    end
}
