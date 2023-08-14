local M = {}

M.opts = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- go
    "gopls",
    "golines",
    "goimports"
  },
}

return M
