local M = {}

M.ensure_installed = true
M.url = "https://github.com/saghen/blink.cmp"
M.build = 'cargo build --release'
M.dependencies = {
  {
    url = "https://github.com/rafamadriz/friendly-snippets"
  }
}

M.lazy = true
M.event = "VeryLazy"

M.config = function()
  require("blink.cmp").setup({
    completion = {
      documentation = {
        auto_show = true
      }
    },
    keymap = {
      preset = "none",
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        'snippet_forward',
        'fallback'
      },
      ['<S-Tab>'] = { "hide" },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },
    sources = {
      default = {
        "buffer",
        "path",
        "lsp",
        "snippets"
      }
    },
    cmdline = {
      sources = function()
        if vim.fn.getcmdtype() == "/" then
          return { "buffer" }
        elseif vim.fn.getcmdwintype() ~= "" then
          return { "cmdline" }
        else
          return {}
        end
      end,
      keymap = {
        preset = "super-tab"
      },
      completion = {
        menu = {
          auto_show = true
        }
      }
    }
  })
end

return M
