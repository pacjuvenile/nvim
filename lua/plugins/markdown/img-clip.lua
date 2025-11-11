local M = {}

M.ensure_installed = true

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

M.config = {
    "HakonHarnes/img-clip.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
        {
            "<leader>ic",
            function()
                vim.cmd([[normal! m`]]) -- 标记光标位置
                vim.cmd([[PasteImage]]) -- 粘贴图片链接
                vim.cmd([[normal! 0v$h"+xdd]]) -- 剪切图片链接并删除新行
                vim.cmd([[normal! ``]]) -- 回到光标位置
            end,
            silent = true,
            desc = "put the image link into the clipboard"
        }
    },
    config = M.setup
}

if M.ensure_installed then
    return M.config
end

return {}
