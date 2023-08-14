local M = {}

M.telescope = {
  defaults = {
    mappings = {
      n = {
        ["C-k"] = require("telescope.actions").move_selection_previous,
        ["C-j"] = require("telescope.actions").move_selection_next,
      },
    },
  }
}

return M
