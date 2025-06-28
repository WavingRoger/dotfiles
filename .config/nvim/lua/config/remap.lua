local map = vim.keymap.set
local builtin = require("telescope.builtin")

-- 🧭 Telescope
map("n", "<leader>ff", builtin.find_files, { desc = "🔍 Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "🔎 Live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "📄 Open buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "❓ Help tags" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "📂 Recently opened files" })
map("n", "<leader>fs", builtin.grep_string, { desc = "🔍 Grep word under cursor" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "🧼 Diagnostics list" })

-- 📁 Oil
map("n", "-", "<cmd>Oil<CR>", { desc = "📁 Open Oil File Manager" })

-- ⚙️ LSP
map("n", "K", vim.lsp.buf.hover, { desc = "💡 LSP Hover Doc" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "🔁 Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "📍 Go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "🔧 Go to implementation" })
map("n", "gr", builtin.lsp_references, { desc = "🔗 Show references" })
map("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "📄 Document Symbols" })
map("n", "<leader>lS", builtin.lsp_workspace_symbols, { desc = "📂 Workspace Symbols" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "✍️ Signature help" })
map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "📂 Add workspace folder" })
map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "📁 Remove workspace folder" })
map("n", "<space>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "📃 List workspace folders" })
map("n", "<space>D", vim.lsp.buf.type_definition, { desc = "📌 Go to type definition" })
map("n", "<space>rn", vim.lsp.buf.rename, { desc = "✏️ Rename symbol" })
map("n", "<space>ca", vim.lsp.buf.code_action, { desc = "🛠️ Code action" })
map("n", "<leader>gf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "🎨 Format buffer" })

-- 🧼 Diagnostics
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "🧼 Line diagnostics (float)" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "⬆️ Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "⬇️ Next diagnostic" })

-- 💾 General Quality-of-Life
map("n", "<leader>w", "<cmd>w<CR>", { desc = "💾 Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "❌ Quit file" })
map("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "🚫 Clear search highlight" })

-- 🔀 Window and split management
map("n", "<leader>sv", "<C-w>v", { desc = "🔳 Split vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "🔲 Split horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "🧮 Equalize splits" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "❎ Close split" })

-- ⌨️ Terminal
map("n", "<leader>tt", "<cmd>split | terminal<CR>", { desc = "💻 Open terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { desc = "🔙 Exit terminal mode" })
