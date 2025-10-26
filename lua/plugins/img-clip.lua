local M = {}

M.setup = function()
    require("img-clip").setup({
        default = {
            -- 文件/目录选项
            dir_path = "assets",
            extension = "png",
            file_name = "%Y-%m-%d-%H-%M-%S",
            use_absolute_path = false,
            relative_to_current_file = false,

            -- 启动选项
            verbose = true,

            -- 模板选项
            template = "$FILE_PATH$CURSOR",
            url_encode_path = false,
            relative_template_path = true,
            use_cursor_in_template = true,
            insert_mode_after_paste = false,
            insert_template_after_cursor = true,

            -- 提示选项
            prompt_for_file_name = false,
            show_dir_path_in_prompt = false,

            -- base64选项
            max_base64_size = 0,
            embed_image_as_base64 = false,

            -- 图像选项
            process_cmd = "",
            copy_images = true,
            download_images = true,

            -- 拖放选项
            drag_and_drop = {
                enabled = true,
                insert_mode = false
            }
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
                vim.cmd("normal! m`") -- 标记光标位置
                vim.cmd("PasteImage") -- 粘贴图片链接
                vim.cmd("normal! v0\"+xdd") -- 剪切图片链接并删除新行
                vim.cmd("normal! ``") -- 回到光标位置
            end,
            silent = true,
            desc = "Use img-clip to paste the image link into the clipboard"
        }
    },
    config = function()
        M.setup()
    end
}
