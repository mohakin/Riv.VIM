return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"pylsp",
					"yamlls",
					"rust_analyzer",
				},
			})

			-- Use default capabilities (cmp_nvim_lsp disabled)
			local capabilities = vim.lsp.protocol.make_client_capabilities()

			-- Configure LSP servers using the new vim.lsp.config API (Neovim 0.11+)
			local servers = require("mason-lspconfig").get_installed_servers()
			for _, server_name in ipairs(servers) do
				vim.lsp.config(server_name, {
					capabilities = capabilities,
				})
				vim.lsp.enable(server_name)
			end
			
			-- Rust-specific settings
			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})
			vim.lsp.enable("rust_analyzer")

			-- Lua-specific settings
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "Snacks" },
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")
		end,
	},
}
