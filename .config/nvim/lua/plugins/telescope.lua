return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true, },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules/",
        ".git/",
        "dist/",
        "build/",
      },
    },
  },
}
