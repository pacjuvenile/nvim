local M = {}

M.ensure_installed = false
M.url = "https://github.com/jake-stewart/multicursor.nvim"
M.branc = "1.0"

M.lazy = false
-- M.event = "VeryLazy"

M.config = function()
  local mc = require("multicursor-nvim")
  mc.setup({})
  vim.keymap.set({ "n", "x" }, "<C-q>", mc.toggleCursor)
  vim.keymap.set({ "n", "x" }, "<C-j>", function() mc.lineAddCursor(1) end)
  vim.keymap.set({ "n", "x" }, "<C-k>", function() mc.lineAddCursor(-1) end)
  vim.keymap.set({ "n", "x" }, "<C-S-j>", function() mc.lineSkipCursor(1) end)
  vim.keymap.set({ "n", "x" }, "<C-S-k>", function() mc.lineSkipCursor(-1) end)

  mc.addKeymapLayer(function(layerSet)
    -- Select a different cursor as the main one.
    layerSet({ "n", "x" }, "<down>", mc.prevCursor)
    layerSet({ "n", "x" }, "<up>", mc.nextCursor)

    -- Delete the main cursor.
    layerSet({ "n", "x" }, "<C-d>", mc.deleteCursor)

    -- Enable and clear cursors using escape.
    layerSet("n", "<esc>", function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      else
        mc.clearCursors()
      end
    end)
  end)
end

return M
