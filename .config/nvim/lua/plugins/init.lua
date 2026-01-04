return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      skip_confirm_for_simple_edits = true,
      delete_to_trash = false,
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- You can use this instead if you prefer devicons:
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  { "unblevable/quick-scope" }  
}
