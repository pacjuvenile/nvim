# Nvim扩展
## 0. 插件管理器
### lazy.nvim
- Requirements
    1. `neovim` >= 0.8.0(needs to be built with `LuaJIT`)
    2. `Git` >= 2.19.0(for partial clones support)
    3. a `Nerd Font`
    4. `luarocks`

## 1. 文件浏览

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
    2. `telescope-fzf-native.nvim` （提供更高的排序性能）
        - Requirements 
            1. `make`
            2. `gcc` or `clang`
    3. `nvim-web-devicons`（提供图标支持）
        - Requirements
            1. `neovim` >= 0.7.0
            2. `Nerd Font`

#### grug-far(多文件查找&替换)
- Requirements
    1. `Neovim` >= 0.11.0
    2. `ripgrep` >= 14
    3. `Nerd Font`
    4. `ast-grep`(ast-grep search engine)

- Dependencies
    - `nvim-web-devicons`/`mini.icons`(icons support)

## 2. 编辑增强
#### nvim-autopairs（括号自动配对）
- Requirements
    - `neovim` >= 0.7.0

#### nvim-surround（快速处理配对）
- Requirements
    - `neovim` >= 0.8.0

#### hop（buffer内快速跳转）

#### blink.cmp（代码提示&补全）
- Requirements
    - `neovim` >= 0.10.0
    - `curl`
    - `git`
    - `rustup`
- Dependencies
    - `friendly-snippets`

#### nvim-treesitter（增强高亮、折叠）
- Requirements
    1. `neovim` >= 0.11.0
    2. `tar`
    3. `curl`
    4. `tree-sitter-cli` >= 0.25.0
    5. `gcc`
    6. `Node` >= 23.0.0

#### indent-blankline.nvim（可视化缩进间距）
- Requirements
    - `neovim` >= 0.10.0

## 3. 界面美化
#### catppuccin（颜色主题）
- Requirements
    - `neovim` >= 0.8.0

#### lualine（状态栏）


## 4. 文档写作
#### peek.nvim（Markdown渲染）
- Requirements
    - `Deno`（JS/TS运行时）

#### img-clip.nvim（放置图片至剪切板）
- Requirements
    - `xclip`(x11) or `wl-clipboard`(wayland)

#### vimtex（Latex环境）

#### asyncrun.vim（异步执行命令）
- Requirements
    - `neovim` >= 0.1.4
