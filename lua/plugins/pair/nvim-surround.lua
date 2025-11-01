local M = {}

M.setup = function()
    require("nvim-surround").setup({})
end

return {
    "kylechui/nvim-surround",
    lazy = true,
    event = "VeryLazy",
    config = function()
        M.setup()
    end
}
