# Nvim插件
## 0. 插件管理器
### lazy.nvim
- Requirements
    1. `neovim` >= 0.8.0(needs to be built with `LuaJIT`)
    2. `Git` >= 2.19.0(for partial clones support)
    3. a `Nerd Font`
    4. `luarocks`

## 1. 编辑效率

### 1.1 跳转

#### nvim-tree.lua（文件树）
- Requirements
    - `neovim` >= 0.9.0
- Dependencies 
    - `nvim-web-devicons`（提供图标支持）
        - Requirements
            1. `neovim` >= 0.7.0
            2. `Nerd Font`

#### telescope.nvim（搜索神器）
- Requirements
    1. `neovim` >= 0.9.0
    2. `ripgrep`
    3. `fd`
- Dependencies
    1. `plenary.nvim`（提供`telescope`所需模块）
    2. `telescope-fzf-native.nvim` 或 `telescope-fzy-native.nvim` （提供更高的排序性能）
        - `telescope-fzf-native` Requirements 
            1. `make`
            2. `gcc` or `clang`
    3. `nvim-web-devicons`（提供图标支持）
        - Requirements
            1. `neovim` >= 0.7.0
            2. `Nerd Font`
    4. `nvim-treesitter`（提供预览时高亮）
    5. `LSP`（提供搜索时提示&补全）

### 1.2 配对
#### nvim-autopairs（括号自动配对）
- Requirements
    - `neovim` >= 0.7.0

#### nvim-surround（快速处理配对）
- Requirements
    - `neovim` >= 0.8.0

### 1.3 美化
#### catppuccin(颜色主题)
- Requirements
    - `neovim` >= 0.8.0

#### indent-blankline.nvim(可视化缩进间距)
- Requirements
    - `neovim` >= 0.10.0

#### nvim-treesitter(高亮（含注入）、折叠)
- Requirements
    1. `neovim` >= 0.11.0
    2. `tar`
    3. `curl`
    4. `tree-sitter-cli` >= 0.25.0
    5. `gcc`
    6. `Node` >= 23.0.0

<!-- - buffer标签 -->
<!--     - bufferline -->
<!-- - 底部状态栏 -->
<!--     - lualine -->
<!-- - 快速移动 -->
<!--     - hop  -->
<!-- - 多文件查找替换 -->
<!--     - grug-far  -->

## 2. LSP相关(代码诊断、提示与补全)
#### mason.nvim（LSP管理器）
- Requirements
    - `neovim` >= 0.10.0
    - `git`
    - `curl` or `wget`
    - `unzip`
    - `tar` or `gtar`
    - `gzip`
    - `cargo`
    - `npm`
- Extensions 
    - `mason-lspconfig.nvim`
        - Requirements
            - `neovim` >= 0.11.0
        - Dependencies 
            - `nvim-lspconfig` >= 2.0.0
                - Requirements
                    - `neovim` >= 0.11.3

#### blink.cmp（代码提示&补全）
- Requirements
    - `neovim` >= 0.10.0
    - `curl`
    - `git`
    - `rustup`
- Dependencies
    - `friendly-snippets`
<!-- - lspsaga -->

## 3. 额外功能
### 3.1 markdown渲染
#### peek.nvim（Markdown渲染）
- Requirements
    - `Deno`（JS/TS运行时）

#### img-clip.nvim（放置图片至剪切板）
- Requirements
    - `xclip`(x11) or `wl-clipboard`(wayland)

### 3.2 命令异步执行
#### asyncrun.vim（异步执行命令）
- Requirements
    - `neovim` >= 0.1.4
