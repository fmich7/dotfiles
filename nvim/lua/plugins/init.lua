return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig-config"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "cpp",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "prettier",
        "gofumpt",
        "golines",
        "goimports_reviser",
        "delve",
        "clangd",
        "clang-format",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = require("configs.telescope-config").opts,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension "ui-select"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
}
