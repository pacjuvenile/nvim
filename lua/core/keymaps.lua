-- vim.g
vim.g.mapleader = " " -- 设置引导符为空格 

-- vim.keymap
vim.keymap.set("n", "j", [[gj]], { noremap = true })
vim.keymap.set("n", "k", [[gk]], { noremap = true })
vim.keymap.set({"n", "v"}, "p", [["+p]], { noremap = true })
vim.keymap.set({"n", "v"}, "<leader>p", [[""p]], { noremap = true })
vim.keymap.set("v", "y", [["+y]], { noremap = true })
vim.keymap.set("v", "x", [["+x]], { noremap = true })
vim.keymap.set("n", "<Esc>", [[:nohl<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>m", [[:%s.\r..g<CR>]], { noremap = true, silent = true })


