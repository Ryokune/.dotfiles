return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "j-hui/fidget.nvim",
    event = "LspAttach", -- Only load when an LSP attaches
    opts = {
      -- optional customization
      notification = {
        window = {
          winblend = 0, -- Make background opaque if you prefer
        },
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        side = "right",
      },
    },
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   opts = {
  --   -- Prevent Mason from automatically installing or enabling these servers
  --     automatic_enable = {
  --       exclude = { "nil_ls" }
  --     }
  --   }
  -- },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "java",
        "kotlin",
      },
    },
  },
}
