local M = {}

M.setup = function()
end

return {
    "skywind3000/asyncrun.vim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        M.setup()
    end
}
