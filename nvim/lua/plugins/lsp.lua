return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}

    opts.inlay_hints = { enabled = false }
    opts.semanticTokens = { enabled = false }

    -- Lua language server configuration
    opts.servers.lua_ls = {
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
    }

    -- Setup function for special LSPs
    opts.setup = opts.setup or {}

    -- Custom clangd setup
    opts.setup.clangd = function(_, clangd_opts)
      clangd_opts.capabilities = clangd_opts.capabilities or {}
      clangd_opts.capabilities.offsetEncoding = { "utf-16" }
    end
  end,
}
