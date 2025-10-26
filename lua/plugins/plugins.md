# Nvim插件
## 0. 插件管理器
### lazy.nvim
- Requirements
    1. Neovim >= 0.8.0(needs to be built with LuaJIT)
    2. Git >= 2.19.0(for partial clones support)
    3. a Nerd Font
    4. luarocks

## 1. 编辑效率

### 1.1 跳转

#### nvim-tree.lua（文件树）
- Requirements
    - Neovim >= 0.9.0
- Dependencies 
    - nvim-web-devicons（提供图标支持）

#### telescope.nvim（搜索神器）
- Requirements
    1. Neovim >= 0.9.0
    2. ripgrep
    3. fd
- Dependencies
    1. plenary.nvim（提供telescope所需模块）
    2. telescope-fzf-native.nvim 或 telescope-fzy-native.nvim （提供更高的排序性能）
    3. nvim-web-devicons（提供图标支持）
    4. nvim-treesitter（提供预览时高亮）
    5. LSP（提供搜索时提示&补全）

### 1.2 配对
#### nvim-autopairs(括号自动配对)
- Requirements
    - Neovim >= 0.7.0

### 1.3 美化
#### indent-blankline.nvim(可视化缩进间距)
- Requirements
    - Neovim >= 0.10.0
#### nvim-treesitter(代码高亮&折叠)
- Requirements
    1. Neovim >= 0.11.0
    2. tar（解压工具）
    3. curl（网络下载工具）
    4. tree-sitter-cli（treesitter命令行接口） >= 0.25.0
    5. gcc（C编译器）
    6. Node（JS运行时） >= 23.0.0
<!-- - buffer标签 -->
<!--     - bufferline -->
<!-- - 底部状态栏 -->
<!--     - lualine -->
<!-- - 括号配对 -->
<!--     - nvim-surround -->
<!-- - 快速移动 -->
<!--     - hop  -->
<!-- - 多文件查找替换 -->
<!--     - grug-far  -->

## 2. lsp(代码诊断、提示与补全)
<!-- - mason -->
<!--     - nvim-lspconfig -->
<!--     - mason-lspconfig -->
<!-- - lspsaga -->
<!-- - blink -->
<!--     - friendly-snippets -->

## 3. 额外功能
### 3.1 markdown渲染
#### peek.nvim
- Requirements
    - Deno（JS/TS运行时）
#### img-clip.nvim
- Requirements
    - xclip(x11) or wl-clipboard(wayland)

### 3.2 命令异步执行
#### asyncrun.vim
- Requirements
    - Neovim >= 0.1.4
