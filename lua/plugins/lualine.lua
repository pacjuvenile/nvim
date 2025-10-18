return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    lazy = true,
    event = "VeryLazy",
    opts = {
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
    },
    config = function(_, opts)
        require("lualine").setup(opts)
    end
}
