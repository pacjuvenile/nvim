# Nvim扩展

插件目录结构：
- 按分类组织（`ui`/`editing`/`navigation`/`writing`），每个插件一个 `.lua` 文件，内含 spec 与 `config` setup
- 不安装的插件 → 文件整段注释（`plugin-manager` 会跳过）
- 不使能的插件 → 保留文件，`lazy = true` 且注释掉触发字段（cmd/keys/event/ft），已安装但不加载
- `extensions.md`：本说明文档

## 0. 插件管理器
### lazy.nvim
- Requirements
    1. `neovim` >= 0.8.0（需以 `LuaJIT` 编译）
    2. `Git` >= 2.19.0（支持部分克隆）
    3. a `Nerd Font`
    4. `luarocks`

## 1. 文件浏览
#### yazi.nvim（终端文件管理器）
- Requirements
    - `yazi`（终端文件管理器）
    - `Nerd Font`
- Dependencies
    - `plenary.nvim`（lua 通用模块）
- 键位
    - `<leader>e` 在当前文件所在目录打开 yazi
    - `<leader>E` 在 nvim 工作目录打开 yazi

#### telescope.nvim（搜索神器）
- Requirements
    1. `neovim` > 0.10.4
    2. `ripgrep`
    3. `fd`
- Dependencies
    1. `plenary.nvim`（提供 `telescope` 所需模块）
    2. `nvim-web-devicons`（提供图标支持）
        - Requirements
            1. `neovim` >= 0.7.0
            2. `Nerd Font`
    3. `telescope-fzf-native.nvim`（提供更高的排序性能）
        - Requirements
            1. `make`
            2. `gcc`
- 键位
    - `<leader>ff` 查找文件
    - `<leader>fg` 全文搜索（live grep）
    - `<leader>fh` 帮助标签
    - `<leader>fb` 缓冲区列表
    - `<leader>fc` 主题选择

#### grug-far.nvim（多文件查找&替换）
- Requirements
    1. `Neovim` >= 0.11.0
    2. `ripgrep` >= 14
    3. `Nerd Font`
- Dependencies
    - `nvim-web-devicons`/`mini.icons`（提供图标支持）
- 命令
    - `:GrugFar`

## 2. 编辑增强
#### nvim-autopairs（括号自动配对）
- Requirements
    - `neovim` >= 0.7.0

#### nvim-surround（快速处理配对）
- Requirements
    - `neovim` >= 0.8.0

#### flash.nvim（跳转高亮）
- 键位
    - `<leader>s`（普通/可视模式）开启 flash 跳转

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

#### outline.nvim（符号大纲）
- 键位
    - `<leader>o` 切换大纲

## 3. 界面美化
#### catppuccin（颜色主题）
- Requirements
    - `neovim` >= 0.8.0

#### lualine（状态栏）
- Dependencies
    - `nvim-web-devicons`（提供图标支持）

#### rainbow-delimiters.nvim（彩虹括号）
- Dependencies
    - `nvim-treesitter/nvim-treesitter`

#### indent-blankline.nvim（可视化缩进间距）
- Requirements
    - `neovim` >= 0.10.0

## 4. 文档写作
#### markdown-preview.nvim（Markdown 预览）
- Requirements
    - `yarn`
    - `node`
    - 外部浏览器（默认调用 wsl 下的 qutebrowser）

#### render-markdown.nvim（Markdown 渲染）
- Dependencies
    - `nvim-treesitter/nvim-treesitter`
    - `nvim-tree/nvim-web-devicons`

#### img-clip.nvim（放置图片至剪切板）
- Requirements
    - `xclip`（X11）或 `wl-clipboard`（Wayland）

#### vimtex（Latex环境）
- Requirements
    - 完整 `TeX` 发行版（`latexmk`、`sioyek` 阅读器）
- 键位
    - `<leader>ll` 编译
    - `<leader>le` 错误列表
    - `<leader>lc` 清理辅助文件
    - `<leader>lv` 正向搜索

## 5. 未启用插件
### 不安装（文件整段注释，如需启用取消注释）
- `aerial.nvim`（大纲，已由 outline.nvim 取代）
- `toggleterm.nvim`（终端）
- `multicursor.nvim`、`vim-visual-multi`（多光标）

### 不使能（`lazy = true`，触发字段已注释，已安装但不加载）
- `neo-tree.nvim`、`nvim-tree.lua`、`oil.nvim`（文件浏览，已被 yazi 取代）
- `render-markdown.nvim`（Markdown 渲染，需启用时取消注释 `ft`）
