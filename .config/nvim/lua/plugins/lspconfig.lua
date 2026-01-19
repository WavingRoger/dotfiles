return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Autoformat on save (your logic, unchanged)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("my.lsp", {}),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if not client:supports_method("textDocument/willSaveWaitUntil")
            and client:supports_method("textDocument/formatting")
        then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("my.lsp.format", { clear = false }),
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({
                bufnr = args.buf,
                id = client.id,
                timeout_ms = 1000,
              })
            end,
          })
        end
      end,
    })

    -- 🔥 Neovim 0.11 native LSP definitions
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    vim.lsp.config("clangd", {
      capabilities = capabilities,
    })

    vim.lsp.config("biome", {
      capabilities = capabilities,
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    })

    -- Explicitly enable servers
    vim.lsp.enable({
      "lua_ls",
      "clangd",
      "biome",
    })
  end,
}
-- return {
--   "neovim/nvim-lspconfig",
--   dependencies = {
--     'saghen/blink.cmp',
--   },
--   config = function()
--     local capabilities = require('blink.cmp').get_lsp_capabilities()
--     vim.api.nvim_create_autocmd('LspAttach', {
--       group = vim.api.nvim_create_augroup('my.lsp', {}),
--       callback = function(args)
--         local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--         if not client then return end
--         if not client:supports_method('textDocument/willSaveWaitUntil')
--             and client:supports_method('textDocument/formatting') then
--           vim.api.nvim_create_autocmd('BufWritePre', {
--             group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
--             buffer = args.buf,
--             callback = function()
--               vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
--             end,
--           })
--         end
--       end,
--     })
--
--
--     require("lspconfig").lua_ls.setup({ capabilities = capabilities })
--     require("lspconfig").clangd.setup({ capabilities = capabilities })
--     require("lspconfig").biome.setup({
--       capabilities = capabilities,
--       filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
--       settings = {
--         -- Optional: add specific biome settings here if needed
--       },
--     })
--   end,
--
-- }
