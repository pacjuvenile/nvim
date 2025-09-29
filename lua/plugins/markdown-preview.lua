return {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    lazy = true,
    cmd = {
        "MarkdownPreviewToggle",
        "MarkdownPreview",
        "MarkdownPreviewStop"
    },
    ft = {
        "markdown"
    },
    keys = {
        { "<leader>mp", "<CMD>MarkdownPreviewToggle<CR>, silent = true" }
    },
    config = function()
    end
}
