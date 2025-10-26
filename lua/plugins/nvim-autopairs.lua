local M = {}

function M.setup()
    require("nvim-autopairs").setup({})
end

return {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = function()
        M.setup()
    end
}
