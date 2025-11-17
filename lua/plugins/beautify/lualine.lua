local M = {}

M.ensure_installed = true
M.enabled = true

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

M.spec = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    lazy = true,
    event = "VeryLazy",
    config = M.config,
}

if M.ensure_installed then
    M.spec.enabled = M.enabled
    return M.spec
end

return {}
