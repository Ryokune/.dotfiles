
require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "slint_lsp", "rust_analyzer", "jdtls", "gradle_ls", "nixd" }
vim.lsp.enable(servers)

vim.lsp.config("nixd", {
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "nixfmt", "--strict" },
      },
      options = {
        flake_parts = {
          expr = '(builtins.getFlake (toString ./.)).debug.options'
        },
        flake_parts_current_system = {
          expr = '(builtins.getFlake (toString ./.)).currentSystem.options'
        },
        -- flake_outputs = {
        --    expr = 'builtins.getFlake (toString ./.)',
        -- },
        home_manager = {
          expr = '(builtins.getFlake (toString ./.)).homeConfigurations.fish.options' 
        },

        nixos = {
          expr = '(builtins.getFlake (toString ./.)).nixosConfigurations.siesta.options',
        },
      },
    },
  },
})
