return {
  {
    "hrsh7th/nvim-cmp",
    enabled = false,  -- Disabled to practice without autocomplete
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",   -- Buffer source for nvim-cmp
      "hrsh7th/cmp-path",     -- Path source for nvim-cmp
      "hrsh7th/cmp-cmdline", -- Command line source for nvim-cmp
      "L3MON4D3/LuaSnip",    -- Snippet engine
      "zbirenbaum/copilot-cmp", -- Copilot source for nvim-cmp
    },
    config = function()
          local cmp = require("cmp")
          local luasnip = require("luasnip")

          cmp.setup({
            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            mapping = cmp.mapping.preset.insert({
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
              ["<C-n>"] = cmp.mapping.select_next_item(),
              ["<C-p>"] = cmp.mapping.select_prev_item(),
            }),
            -- The order of sources determines their priority
            sources = cmp.config.sources({
              { name = "copilot" },
              { name = "nvim_lsp" },
              { name = "luasnip" },
              { name = "buffer" },
              { name = "path" },
            }),
          })

          -- Command line completion setup
          cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } },
          })
          cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = "path" }, { name = "cmdline" } }),
          })
        end,
      },


  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" }, -- Optional: for pre-made snippets
    config = function()
      -- Require luasnip and load snippets
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load() -- Load snippets from friendly-snippets
      -- Keymaps for navigating snippets
      vim.keymap.set({"i", "s"}, "<C-k>", function() luasnip.expand_or_jump() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-j>", function() luasnip.jump(-1) end, {silent = true})
    end,
  }
}
