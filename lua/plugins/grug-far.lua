return {
    "MagicDuck/grug-far.nvim",
    lazy = true,
    cmd = "GrugFar",
    opts = {},
    config = function(_, opts)
        require("grug-far").setup(opts)
    end
}
