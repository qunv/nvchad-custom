local M = {}

local cmp = require "cmp"
M.cmp = {
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
  }
}

return M
