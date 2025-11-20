local M = {}

M.ensure_installed = true
M.url = "https://github.com/nvim-lualine/lualine.nvim"
M.dependencies = {
    "nvim-tree/nvim-web-devicons"
}

M.lazy = true
M.event = "VeryLazy"

M.config = function()
    require("lualine").setup({
        options = {
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
        },
        extensions = { "nvim-tree" },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff" },
            lualine_c = { "filename" },
            lualine_x = {
                "encoding",
                "filesize",
                "filetype",
            },
            lualine_y = { "progress" },
            lualine_z = { "location" }
        }
    })
    vim.opt.showmode = false
end

return M
