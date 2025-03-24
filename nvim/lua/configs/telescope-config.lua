local actions = require "telescope.actions"
local themes = require "telescope.themes"

local M = {}

M.opts = {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<Esc>"] = actions.close,
      },
    },
  },
  extensions = {
    ["ui-select"] = themes.get_dropdown {},
  },
}

return M
