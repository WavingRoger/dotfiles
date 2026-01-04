return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*" }
  },
  opts = {
    -- Snippet engine preset
    snippets = { preset = "luasnip" },

    -- Keymaps
    keymap = { preset = "default" },

    -- Signature help
    signature = { enabled = true },

    -- Look & feel
    appearance = {
      nerd_font_variant = "mono"
    },

    -- Completion docs
    completion = {
      documentation = { auto_show = true }
    },

    -- Completion sources
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    -- Fuzzy matching
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" },

  config = function(_, opts)
    -- Setup blink.cmp
    require("blink.cmp").setup(opts)

    -- Load custom LuaSnip snippets
    require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/lua/snippets"
    })

    -- Optional: also load friendly-snippets if you want extra snippets
    -- require("luasnip.loaders.from_vscode").lazy_load()
  end
}
