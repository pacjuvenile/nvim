local M = {}

function M.setup()
    require("ibl").setup({})
end

return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        M.setup()
    end
}
