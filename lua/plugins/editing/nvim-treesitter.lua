local M = {}

M.ensure_installed = true
M.url = "https://github.com/nvim-treesitter/nvim-treesitter"
M.branch = "main"

M.lazy = false

M.config = function()
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

    "matlab",
  }

  local ts_configs = require("langs").ts_configs
  for _, ts_config in ipairs(ts_configs) do
    if ts_config.ensure_installed ~= false then
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
      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo[0][0].foldmethod = "expr"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  })
end

return M
