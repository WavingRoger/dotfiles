return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		-- empty setup using defaults
		require("nvim-tree").setup()

		-- OR setup with some options
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
				git_ignored = true,
			},
		})
		local keymap = vim.keymap
		keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "Toggles NvimTree" })
		keymap.set("n", "<leader>h", "<cmd>NvimTreeFocus<CR>", { desc = "Focuses NvimTree" })
	end,
}
