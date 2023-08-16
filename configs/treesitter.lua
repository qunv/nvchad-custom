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
    "java"
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

return M
