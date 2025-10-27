local M = {}

M.setup = function()
    require("img-clip").setup({
        default = {
            -- 模板选项
            insert_mode_after_paste = false,

            -- 提示选项
            prompt_for_file_name = false,
        }
    })
end

return {
    "HakonHarnes/img-clip.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
        {
            "<leader>ic",
            function()
                vim.cmd([[normal! m`]]) -- 标记光标位置
                vim.cmd([[PasteImage]]) -- 粘贴图片链接
                vim.cmd([[normal! v0"+xdd]]) -- 剪切图片链接并删除新行
                vim.cmd([[normal! ``]]) -- 回到光标位置
            end,
            silent = true,
            desc = "put the image link into the clipboard"
        }
    },
    config = function()
        M.setup()
    end
}
