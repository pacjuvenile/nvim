local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ 
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=main",
    lazyrepo,
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)   -- vim.opt.rtp.prepend(vim.opt.rtp, lazypath)的语法糖

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
