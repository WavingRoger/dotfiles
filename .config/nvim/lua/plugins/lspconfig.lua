return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "saghen/blink.cmp",
    {
      "folke/lazydev.nvim",
      lazy = true,
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },

  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- =====================================================
    -- Autoformat on save
    -- =====================================================
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("my.lsp", {}),

      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
          return
        end

        if not client:supports_method("textDocument/willSaveWaitUntil")
            and client:supports_method("textDocument/formatting")
        then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup(
              "my.lsp.format",
              { clear = false }
            ),

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

    -- =====================================================
    -- Rust
    -- =====================================================
    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,

      settings = {
        ["rust_analyzer"] = {
          cargo = {
            allFeatures = true,
          },

          checkOnSave = true,

          check = {
            command = "clippy",
          },
        },
      },
    })

    -- =====================================================
    -- Markdown
    -- =====================================================
    vim.lsp.config("marksman", {
      capabilities = capabilities,
    })

    -- =====================================================
    -- Lua
    -- =====================================================
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

    -- =====================================================
    -- C / C++
    -- =====================================================
    vim.lsp.config("clangd", {
      capabilities = capabilities,
    })

    -- =====================================================
    -- JS / TS / React / Next.js
    -- =====================================================
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,

      init_options = {
        hostInfo = "neovim",
      },

      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },

        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    })

    -- =====================================================
    -- Biome (Formatter + Linter)
    -- =====================================================
    vim.lsp.config("biome", {
      capabilities = capabilities,

      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "json",
        "jsonc",
      },
    })

    -- =====================================================
    -- Svelte
    -- =====================================================
    vim.lsp.config("svelte", {
      capabilities = capabilities,

      settings = {
        svelte = {
          plugin = {
            typescript = {
              diagnostics = {
                enable = true,
              },

              hover = {
                enable = true,
              },
            },
          },
        },
      },
    })

    -- =====================================================
    -- Tailwind CSS
    -- =====================================================
    vim.lsp.config("tailwindcss", {
      capabilities = capabilities,

      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "svelte",
      },
    })

    -- =====================================================
    -- LaTeX
    -- =====================================================
    vim.lsp.config("texlab", {
      capabilities = capabilities,

      settings = {
        texlab = {
          build = {
            executable = "latexmk",

            args = {
              "-pdf",
              "-interaction=nonstopmode",
              "-synctex=1",
              "-output-directory=build",
              "%f",
            },

            onSave = true,
            forwardSearchAfter = true,
          },

          forwardSearch = {
            executable = "zathura",

            args = {
              "--synctex-forward",
              "%l:1:%f",
              "%p",
            },
          },

          chktex = {
            onOpenAndSave = true,
            onEdit = false,
          },

          diagnosticsDelay = 300,
        },
      },
    })
    -- =====================================================
    -- Python
    -- =====================================================
    vim.lsp.config("pyright", {
      capabilities = capabilities,

      settings = {
        pyright = {
          disableOrganizeImports = true,
        },

        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    vim.lsp.config("ruff", {
      capabilities = capabilities,
    })
    -- =====================================================
    -- Enable Servers
    -- =====================================================
    vim.lsp.enable({
      "lua_ls",
      "clangd",
      "biome",
      "marksman",
      "texlab",
      "rust_analyzer",
      "pyright",
      "ruff",
      "ts_ls",
      "svelte",
      "tailwindcss",
    })
  end,
}
