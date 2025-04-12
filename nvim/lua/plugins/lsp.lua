return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    semanticTokens = { enabled = false },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            hint = {
              enable = false, -- disables inlay hints
            },
            semantic = {
              enable = false, -- disables semantic tokens
            },
          },
        },
      },
    },
  },
}
