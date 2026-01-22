local ts_configs = {}
local ls_configs = {}

local lua_dir = vim.fn.stdpath("config") .. "/lua"
local langs_config_full_dir = vim.fn.glob(lua_dir .. "/languages/**/*.lua", false, true)
for _, lang_config_full_dir in ipairs(langs_config_full_dir) do
  local lang_config_module = lang_config_full_dir:gsub("^" .. lua_dir .. "/", ""):gsub("%.lua$", "")
  local lang_config = require(lang_config_module)
  -- treesitter配置表
  local ts_config = lang_config.ts_config
  table.insert(ts_configs, ts_config)
  -- language server配置表
  local ls_config = lang_config.ls_config
  table.insert(ls_configs, ls_config)
end

-- treesitter配置
local treesitter_path = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter"
if vim.uv.fs_stat(treesitter_path) then
  local install_dir = vim.fn.stdpath("data") .. "/site"
  require("nvim-treesitter").setup({
    install_dir = install_dir
  })

  -- 解析器管理
  local ensure_installed = {
    -- 文档查询
    "vim",
    "vimdoc",
    "query",
    -- 配置脚本
    "bash",
    "json",
    "yaml",
    "toml",
    -- 科学计算
    "matlab",
  }

  for _, ts_config in ipairs(ts_configs) do
    if ts_config.parser_installed == true then
      for _, parser in ipairs(ts_config.parser) do
        if not vim.tbl_contains(ensure_installed, parser) then
          table.insert(ensure_installed, parser)
        end
      end
    end
  end
  require("nvim-treesitter").install(ensure_installed)

  local treesitter_augroup = vim.api.nvim_create_augroup("Treesitter", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = treesitter_augroup,
    pattern = "VeryLazy",
    callback = function()
      local local_parsers_full_dir = vim.fn.glob(install_dir .. "/parser/**/*.so", false, true)
      for _, local_parser_full_dir in ipairs(local_parsers_full_dir) do
        local local_parser = local_parser_full_dir:gsub("^" .. install_dir .. "/parser/", ""):gsub("%.so$", "")
        if not vim.tbl_contains(ensure_installed, local_parser) then
          require("nvim-treesitter").uninstall(local_parser)
        end
      end
    end,
    once = true
  })

  local pattern_filetype = {}
  for _, parser in ipairs(ensure_installed) do
    local has_parser, _ = pcall(vim.treesitter.language.inspect, parser)
    if has_parser then
      -- 找到解析器配对的全部文件类型
      local parser_filetypes = vim.treesitter.language.get_filetypes(parser)
      for _, parser_filetype in ipairs(parser_filetypes) do
        if not vim.tbl_contains(pattern_filetype, parser_filetype) then
          table.insert(pattern_filetype, parser_filetype)
        end
      end
    end
  end
  vim.api.nvim_create_autocmd("FileType", {
    group = treesitter_augroup,
    pattern = pattern_filetype,
    callback = function()
      vim.treesitter.start()
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
  })
end

-- language servers配置
for _, ls_config in ipairs(ls_configs) do
  if ls_config.enabled ~= false and ls_config.name ~= nil then
    vim.lsp.config(ls_config.name, ls_config)
    vim.lsp.enable(ls_config.name)
  end
end
