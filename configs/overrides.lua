local M = {}

M.treesitter = {
  ensure_installed = {
    "go",
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

local cmp = require "cmp"
M.cmp = {
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
  }
}

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
