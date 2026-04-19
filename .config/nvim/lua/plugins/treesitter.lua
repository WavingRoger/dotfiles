return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- New rewritten branch
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
