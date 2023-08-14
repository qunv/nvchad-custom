local M = {}

M.disabled = {
  n = {
      ["<leader>b"] = "",
      ["<C-j>"] = "",
      ["<C-k>"] = "",
      ["<C-n>"] = "", -- disabled default nvim-tree Toggle
      ["<leader>e"] = "", -- disabled default nvim-tree focus 
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapContinue <CR>",
      "Open debugging option"
    },
    ["<leader>bb"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>1"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    -- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

return M
