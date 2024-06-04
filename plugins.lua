local plugins = {
  {
    "williamboman/mason.nvim",
    opts = require("custom.configs.mason").opts
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("custom.configs.treesitter").treesitter
  },
  {
    "hrsh7th/nvim-cmp",
		opts = require("custom.configs.cmp").cmp,
  },
  {
    "nvim-tree/nvim-tree.lua",
		opts = require("custom.configs.nvim-tree").nvimtree,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function ()
      require "plugins.configs.telescope"
      require "custom.configs.telescope"
    end
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "nvim-neotest/nvim-nio"
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    init = function ()
      require("dapui").setup(require("custom.configs.nvim-dap-ui").ui)
    end,
    config = function ()
      require("custom.configs.nvim-dap-ui").config()
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "fatih/vim-go",
    ft = "go"
  },
  {
    "ellisonleao/dotenv.nvim",
    init = function ()
      require('dotenv').setup()
    end
  },
  {
    "windwp/nvim-ts-autotag",
    init = function ()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    "ojroques/nvim-osc52",
    init = function ()
      require('osc52').setup()
    end
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  }
}
return plugins
