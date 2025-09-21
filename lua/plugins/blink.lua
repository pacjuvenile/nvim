return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = {
    "rafamadriz/friendly-snippets"
  },
  lazy = true,
  event = "VeryLazy",
  opts = {
    completion = {
      documentation = {
        auto_show = true
      }
    },
    keymap = {
      preset = "super-tab"
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
      sources = function ()
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
    },
  },
  config = function (_, opts)
    require("blink.cmp").setup(opts)
  end
}
