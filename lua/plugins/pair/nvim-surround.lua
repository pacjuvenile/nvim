local M = {}

M.setup = function()
end

return {
    "kylechui/nvim-surround",
    lazy = true,
    event = "VeryLazy",
    config = function()
        M.setup()
    end
}
