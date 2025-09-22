return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = "VeryLazy",
  opts = {
    ensure_installed = {
      -- 配置脚本
      "bash",
      "toml",
      "yaml",
      "json",
      "vim",
      "lua",
      -- 笔记/论文
      "markdown",
      "typst",
      -- 数值计算
      "matlab",
      "haskell",
      -- 科研绘图
      "r",
      -- 应用层
      "python",
      "java",
      "go",
      -- 系统/高性能
      "c",
      "cpp",
      "zig",
      "rust",
      -- 前端开发
      "html",
      "css",
      "javascript",
      "typescript",
      -- 硬件描述
      "verilog",
      "vhdl"
    },
    highlight = { enable = true }
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
