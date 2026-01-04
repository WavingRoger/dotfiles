return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'saghen/blink.cmp',
  },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my.lsp', {}),
      callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if not client then return end
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            end,
          })
        end
      end,
    })


    require("lspconfig").lua_ls.setup({ capabilities = capabilities })
    require("lspconfig").clangd.setup({ capabilities = capabilities })
    require("lspconfig").rust_analyzer.setup({ capabilities = capabilities })
    require("lspconfig").biome.setup({
      capabilities = capabilities,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      settings = {
        -- Optional: add specific biome settings here if needed
      },
    })
  end,

}
