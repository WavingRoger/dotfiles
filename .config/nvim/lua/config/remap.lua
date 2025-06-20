local map = vim.keymap.set
local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

map("n", "-", "<cmd>Oil<CR>", { desc = "Open Oil File Manager" })

-- LSP Remaps
map("n", "K", vim.lsp.buf.hover, { desc = "Opens Hover information" })
map("n", "gD", vim.lsp.buf.declaration, {})
map("n", "gd", vim.lsp.buf.definition, {})
map("n", "K", vim.lsp.buf.hover, {})
map("n", "gi", vim.lsp.buf.implementation, {})
map("n", "<C-k>", vim.lsp.buf.signature_help, {})
map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {})
map("n", "<space>D", vim.lsp.buf.type_definition, {})
map("n", "<space>rn", vim.lsp.buf.rename, {})
map("n", "<space>ca", vim.lsp.buf.code_action, {})
map("n", "gr", vim.lsp.buf.references, {})
map("n", "<leader>gf", vim.lsp.buf.format, {})
