return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "ray-x/lsp_signature.nvim",
    },

    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "pylsp", "yamlls", "rust_analyzer" },
      })

      -- Clear existing autocmds to prevent "File exists" errors on reload
      local lsp_group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = lsp_group,
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          -- Auto-enable Inlay Hints
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end

          -- Setup Signature Help
          require("lsp_signature").on_attach({
            bind = true,
            handler_opts = { border = "rounded" },
            hint_enable = false,
          }, args.buf)
        end,
      })

      vim.api.nvim_set_hl(0, "LspInlayHint", { link = "Comment" })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -----------------------------------------------------------------------
      -- Server Configurations (0.11 Style)
      -----------------------------------------------------------------------

      -- Rust: DISABLE CLIPPY & Enable Hints
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = true,
            inlayHints = {
              enable = true,
              chainingHints = { enable = true },
              bindingModeHints = { enable = true },
              parameterHints = { enable = true },
              typeHints = { enable = true },
              renderColons = true,
            },
            diagnostics = {
              enable = true,
              experimental = {
                enable = true,
              },
            },
            hover = {
              actions = {
                enable = true,
                references = { enable = true },
              },
            },
          },
        },
      })

      -- Lua
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            hint = { enable = true },
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      -- Go
      vim.lsp.config("gopls", {
        capabilities = capabilities,
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              parameterNames = true,
            },
          },
        },
      })

      -- Enable all servers
      local servers = { "lua_ls", "gopls", "pylsp", "yamlls", "rust_analyzer" }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end

      -- Format on save for Rust
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = lsp_group,
        pattern = "*.rs",
        callback = function() vim.lsp.buf.format({ async = false }) end,
      })
    end,
  },
}
