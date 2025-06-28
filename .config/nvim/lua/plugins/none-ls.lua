return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local helpers = require("null-ls.helpers")

    -- Custom clang-tidy diagnostic for C/C++
    local clang_tidy = {
      name = "clang-tidy",
      method = null_ls.methods.DIAGNOSTICS,
      filetypes = { "c", "cpp" },
      generator = null_ls.generator({
        command = "clang-tidy",
        args = {
          "--quiet",
          "--extra-arg=-std=c11", -- or c++17, c++20
          "$FILENAME",
        },
        to_stdin = false,
        from_stderr = true,
        format = "line",
        check_exit_code = function(code)
          return code <= 1
        end,
        on_output = helpers.diagnostics.from_pattern(
          [[^(.*):(%d+):(%d+): (%w+): (.*)]],
          { "filename", "row", "col", "severity", "message" },
          {
            severities = {
              warning = helpers.diagnostics.severities["warning"],
              error = helpers.diagnostics.severities["error"],
              note = helpers.diagnostics.severities["information"],
            },
          }
        ),
      }),
    }

    -- Custom rustfmt formatter for Rust
    local rustfmt = {
      name = "rustfmt",
      method = null_ls.methods.FORMATTING,
      filetypes = { "rust" },
      generator = null_ls.formatter({
        command = "rustfmt",
        args = { "--emit=stdout" },
        to_stdin = true,
      }),
    }

    null_ls.setup({
      sources = {
        -- Lua Formatter
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-width", "2" },
        }),

        -- JS/TS/HTML/CSS/Markdown Formatter
        null_ls.builtins.formatting.prettier.with({
          extra_args = { "--print-width", "80", "--single-quote", "--no-semi" },
          filetypes = { "javascript", "typescript", "html", "css", "markdown" },
        }),

        -- Python Formatter
        null_ls.builtins.formatting.black.with({
          extra_args = { "--line-length", "88" },
        }),

        -- Rust Formatter
        rustfmt,

        -- C/C++ Formatter
        null_ls.builtins.formatting.clang_format.with({
          extra_args = { "--style=Google" },
          filetypes = { "c", "cpp" },
        }),

        -- C/C++ Diagnostics (Clang-Tidy)
        clang_tidy,
      },

      -- Format on save
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local group = vim.api.nvim_create_augroup("Format", { clear = true })

          vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = group,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
