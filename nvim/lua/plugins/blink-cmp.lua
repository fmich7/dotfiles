return {
  "saghen/blink.cmp",
  dependencies = {
    "onsails/lspkind.nvim",
  },
  opts = function(_, opts)
    opts.completion = {
      ghost_text = {
        enabled = false,
      },

      menu = {
        draw = {
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              highlight = function(ctx)
                -- return (
                -- require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
                -- or "BlinkCmpKind"
                -- ) .. ctx.kind
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },

            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          },
        },
      },

      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
        },
      },
    }
  end,
}
