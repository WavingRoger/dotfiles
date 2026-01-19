return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- New rewritten branch
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    local parsers = { "lua", "vim", "vimdoc", "bash", "markdown" }

    for _, parser in ipairs(parsers) do
      pcall(ts.install, parser)
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
