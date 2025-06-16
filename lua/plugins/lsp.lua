return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			autoformat = false,
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim", "Snacks" },
							},
						},
					},
				},
				pylsp = {},
				gopls = {},
				yamlls = {},
			},
		},
		config = function(_, opts)
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- lua language server
					"gopls", -- Go language server
					"pylsp", -- Python language server
					"vimls", -- Vim language server
					"yamlls", -- YAML language server
				},
			})

			for server, config in pairs(opts.servers) do
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
