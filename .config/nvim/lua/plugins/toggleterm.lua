return {
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<C-\>]],
      shade_terminals = true,
      direction = "float", -- default direction
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      -- Float terminal
      local float_term = Terminal:new({ direction = "float", hidden = true })
      vim.keymap.set({ "n", "t" }, "<A-i>", function()
        float_term:toggle()
      end, { noremap = true, silent = true })

      -- Vertical terminal
      local vert_term = Terminal:new({ direction = "vertical", hidden = true })
      vim.keymap.set({ "n", "t" }, "<A-v>", function()
        vert_term:toggle()
      end, { noremap = true, silent = true })

      -- Horizontal terminal
      local hori_term = Terminal:new({ direction = "horizontal", hidden = true })
      vim.keymap.set({ "n", "t" }, "<A-h>", function()
        hori_term:toggle()
      end, { noremap = true, silent = true })
    end,
  },
}
