local M = {}

M.ensure_installed = true
M.url = "https://github.com/nvim-tree/nvim-tree.lua"
M.dependencies = {
    {
        url = "https://github.com/nvim-tree/nvim-web-devicons"
    }
}

M.enabled = true
M.lazy = true
M.keys = {
    { "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "nvim-tree toggle" }
}

M.config = function()
    local on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
            return {
                desc = "nvim-tree " .. desc,
                buffer = bufnr,
                silent = true
            }
        end

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.del("n", "g?", { buffer = bufnr } )
        vim.keymap.set("n", "?", api.tree.toggle_help, opts("show help"))

        vim.keymap.del("n", "<CR>", { buffer = bufnr })
        vim.keymap.set("n", "<CR>", function()
            local node = api.tree.get_node_under_cursor()
            if node.type == "file" then
                api.node.open.edit(node)
            elseif node.type == "directory" then
                api.tree.change_root_to_node(node)
            end
        end, opts("change root directory or open file"))

        vim.keymap.del("n", "H", { buffer = bufnr })
        vim.keymap.set("n", "H", function()
            api.tree.change_root_to_parent()
        end, opts("change root directory to parent"))

        vim.keymap.set("n", "h", function()
            local node = api.tree.get_node_under_cursor()
            if node.type == "directory" and node.open then
                api.node.navigate.parent_close(node)
            end
        end, opts("collapse current directory"))

        vim.keymap.set("n", "l", function()
            local node = api.tree.get_node_under_cursor()
            if node.type == "directory" and not node.open then
                api.node.expand(node, {
                    expand_until = function(expansion_count)
                        return expansion_count < 1
                    end
                })
            end
        end, opts("expand current directory"))

        vim.keymap.del("n", "L", { buffer = bufnr })
        vim.keymap.set("n", "L", function()
            local node = api.tree.get_node_under_cursor()
            if node.type ~= "directory" then
                return
            end
            local root_path = vim.fn.getcwd()
            local node_path = node.absolute_path

            if vim.startswith(node_path, root_path) and #node_path > #root_path then
                api.tree.change_root_to_node(node)
            end
        end, opts("change root directory to child"))
    end

    require("nvim-tree").setup({
        view = {
            side = "right",
            width = 25
        },
        git = {
            enable = true
        },
        filters = {
            git_ignored = false
        },
        on_attach = on_attach
    })
end

return M
