return{
    {
	"mason-org/mason.nvim",
	opts = {
	    ui = {
		icons = {
		    package_installed = "✓",
		    package_pending = "➜",
		    package_uninstalled = "✗"
		}
	    }
	}
    },
    {
	{
	    "mason-org/mason-lspconfig.nvim",
	    opts = {
		ensure_installed = { "lua_ls","marksman"},
	    },
	}
    },
    {
	"neovim/nvim-lspconfig",
	config = function()
	    require("lspconfig").lua_ls.setup({})
	    require("lspconfig").marksman.setup({})
	end,
    }
}
