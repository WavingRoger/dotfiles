return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end) --[[ h ]]
		vim.keymap.set("n", "<C-t>", function()
			harpoon:list():select(2)
		end)--[[ t ]]
		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(3)
		end)--[[ j ]]
		vim.keymap.set("n", "<C-s>", function()
			harpoon:list():select(4)
		end)--[[ s ]]

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-p>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():next()
		end)
	end,
}
